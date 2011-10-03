/**
 * The contents of this file are subject to the license and copyright
 * detailed in the LICENSE and NOTICE files at the root of the source
 * tree and available online at
 *
 * http://www.dspace.org/license/
 */
package org.dspace.rest.providers;

import org.sakaiproject.entitybus.entityprovider.EntityProvider;
import org.sakaiproject.entitybus.entityprovider.EntityProviderManager;
import org.sakaiproject.entitybus.entityprovider.capabilities.*;
import org.sakaiproject.entitybus.entityprovider.extension.RequestStorage;
import org.sakaiproject.entitybus.entityprovider.extension.Formats;
import org.dspace.core.Context;
import org.dspace.content.Collection;
import org.dspace.content.Community;
import org.dspace.eperson.EPerson;
import org.dspace.authorize.AuthorizeException;
import org.sakaiproject.entitybus.exception.EntityException;
import org.apache.log4j.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.sakaiproject.entitybus.EntityView;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;
import org.dspace.rest.util.UtilHelper;
import org.dspace.rest.util.UserRequestParams;
import java.lang.reflect.*;
import org.dspace.rest.util.RecentSubmissionsException;
import org.sakaiproject.entitybus.EntityReference;
import org.sakaiproject.entitybus.EntityView;
import org.sakaiproject.entitybus.entityprovider.EntityProviderMethodStore;
import org.sakaiproject.entitybus.entityprovider.extension.CustomAction;
import org.sakaiproject.entitybus.entityprovider.extension.*;
import org.dspace.rest.entities.*;
import javax.servlet.ServletInputStream;
import org.sakaiproject.entitybus.util.devhelper.AbstractDeveloperHelperService;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import org.sakaiproject.entitybus.rest.EntityEncodingManager;
import org.sakaiproject.entitybus.entityprovider.extension.Formats;
import org.sakaiproject.entitybus.entityprovider.extension.RequestGetter;

/**
 * Base abstract class for Entity Providers. Takes care about general
 * operations like extracting url parameters, registration, unregistration <br/>
 * and other stuff. The Entity Provider should extend this class and implement
 * CoreEntityProvider. This class implements capabilities as it is currently
 * planed for REST support in DSpace, meaning, there is no Inputable capability
 * implemented but could be easily extended later if necessary.
 *
 * @author Bojan Suzic(bojan.suzic@gmail.com)
 */
public abstract class AbstractBaseProvider implements EntityProvider, Resolvable, CollectionResolvable, InputTranslatable, RequestAware, Outputable, Describeable, ActionsExecutable, Redirectable, RequestStorable, RequestInterceptor {

    // query parameters used in subclasses
    protected RequestStorage reqStor;
    protected boolean idOnly, topLevelOnly, in_archive, immediateOnly, withdrawn;
    protected String user = "";
    protected String pass = "";
    protected String userc = "";
    protected String passc = "";
    protected String query, _order, _sort, loggedUser, _sdate, _edate;
    protected int _start, _page, _perpage, _limit, sort;
    protected List<Integer> sortOptions = new ArrayList<Integer>();
    protected Collection _collection = null;
    protected Community _community = null;
    private static Logger log = Logger.getLogger(AbstractBaseProvider.class);
    protected Map<String, String> func2actionMapGET = new HashMap<String, String>();
    protected Map<String, String> func2actionMapPUT = new HashMap<String, String>();
    protected Map<String, String> func2actionMapPOST = new HashMap<String, String>();
    protected Map<String, String> func2actionMapDELETE = new HashMap<String, String>();
    protected Map<String, Class<?>[]> funcParamsGET = new HashMap<String, Class<?>[]>();
    protected Map<String, Class<?>[]> funcParamsPUT = new HashMap<String, Class<?>[]>();
    protected Map<String, Class<?>[]> funcParamsPOST = new HashMap<String, Class<?>[]>();
    protected Map<String, Class<?>[]> funcParamsDELETE = new HashMap<String, Class<?>[]>();
    protected Map<String, String[]> inputParamsPOST = new HashMap<String, String[]>();
    protected Map<String, String> func2actionMapGET_rev = new HashMap<String, String>();
    protected Map<String, String> func2actionMapPUT_rev = new HashMap<String, String>();
    protected Map<String, String> func2actionMapPOST_rev = new HashMap<String, String>();
    protected Map<String, String> func2actionMapDELETE_rev = new HashMap<String, String>();
    protected Class<?> processedEntity = CommunityEntity.class;
    private Constructor<?> ctr = null;
    protected Constructor<?> entityConstructor = null;
    protected Map<String, Object> reqInput = new HashMap<String, Object>();
    protected RequestGetter requestGetter;

    /**
     * Handle registration of EntityProvider
     * @param entityProviderManager
     * @throws java.sql.SQLException
     */
    public AbstractBaseProvider(
            EntityProviderManager entityProviderManager) throws SQLException {
        this.entityProviderManager = entityProviderManager;
        try {
            init();
        } catch (Exception e) {
            throw new RuntimeException("Unable to register the provider (" + this + "): " + e, e);

        } // get request info for later parsing of parameters
        //this.reqStor = entityProviderManager.getRequestStorage();

    }

    protected void initMappings(Class<?> processedEntity) throws NoSuchMethodException {
        ctr = processedEntity.getDeclaredConstructor(new Class<?>[]{String.class, Context.class, Integer.TYPE, UserRequestParams.class});
        // scan for methods;
        Method[] entityMethods = processedEntity.getMethods();
        for (Method m : entityMethods) {
            //System.out.println("checked method " + m.getName());
            String fieldPUT = func2actionMapPUT.get(m.getName());
            if (fieldPUT != null) {
//                System.out.println("added " + fieldPUT + ":" + m.getName());
                addParameters(fieldPUT, m.getParameterTypes(), funcParamsPUT);
                addMethod(fieldPUT, m.getName(), func2actionMapPUT_rev);
            }
            String fieldGET = func2actionMapGET.get(m.getName());
            if (fieldGET != null) {
                addParameters(fieldGET, m.getParameterTypes(), funcParamsGET);
                addMethod(fieldGET, m.getName(), func2actionMapGET_rev);
            }
            String fieldPOST = func2actionMapPOST.get(m.getName());
            if (fieldPOST != null) {
                addParameters(fieldPOST, m.getParameterTypes(), funcParamsPOST);
                addMethod(fieldPOST, m.getName(), func2actionMapPOST_rev);
            }
            String fieldDELETE = func2actionMapDELETE.get(m.getName());
            if (fieldDELETE != null) {
                addParameters(fieldDELETE, m.getParameterTypes(), funcParamsDELETE);
                addMethod(fieldDELETE, m.getName(), func2actionMapDELETE_rev);
            }
        }
    }

    // view_edit actions - deprecated
    protected void createPUTActions(Class<?> processedEntity) throws NoSuchMethodException {
        ctr = processedEntity.getDeclaredConstructor(new Class<?>[]{String.class, Context.class, UserRequestParams.class});
        EntityProviderMethodStore epms = entityProviderManager.getEntityProviderMethodStore();
        // scan for methods;
        Method[] CommunityMethods = processedEntity.getMethods();

        for (Method m : CommunityMethods) {
            System.out.println("====PUT Analyzed method " + m.getName());
        }
        for (Method m : CommunityMethods) {
            String field = func2actionMapPUT.get(m.getName());
            if (field != null) {
                System.out.println("===PUT Field found " + field);
                //CustomAction locCA = new CustomAction(field, EntityView.VIEW_EDIT, "putAction");

                // try {
                //locCA.setMethod(this.getClass().getMethod("putAction", new Class<?>[]{EntityReference.class, EntityView.class}));
                //epms.addCustomAction(getEntityPrefix(), locCA);
                addParameters(field, m.getParameterTypes(), funcParamsPUT);
                addMethod(field, m.getName(), func2actionMapPUT_rev);
                // } catch (NoSuchMethodException ex) {
                //     ex.printStackTrace();
                // }
            }
        }

        System.out.println("::::::::::");
        for (String key : funcParamsPUT.keySet()) {
            System.out.println("key " + key);
            Class<?>[] kl = funcParamsPUT.get(key);
            for (Class<?> k : kl) {
                System.out.println(k.getName());
            }
        }

    }

    // view_show actions - deprecated
    protected void createActions(Class<?> processedEntity) throws NoSuchMethodException {
        ctr = processedEntity.getDeclaredConstructor(new Class<?>[]{String.class, Context.class, UserRequestParams.class});
        EntityProviderMethodStore epms = entityProviderManager.getEntityProviderMethodStore();
        // scan for methods;
        Method[] CommunityMethods = processedEntity.getMethods();

        for (Method m : CommunityMethods) {
            System.out.println("====Analyzed method " + m.getName());
        }
        for (Method m : CommunityMethods) {
            String field = func2actionMapGET.get(m.getName());
            if (field != null) {
                System.out.println("===Field found " + field);
                //  CustomAction locCA = new CustomAction(field, EntityView.VIEW_SHOW, "testAction");

                //try {
                //  locCA.setMethod(this.getClass().getMethod("testAction", new Class<?>[]{EntityReference.class, EntityView.class}));
                //  epms.addCustomAction(getEntityPrefix(), locCA);
                addParameters(field, m.getParameterTypes(), funcParamsGET);
                addMethod(field, m.getName(), func2actionMapGET_rev);
                //} catch (NoSuchMethodException ex) {
                //    ex.printStackTrace();
                // }
            }
        }
    }

    // next two actions for put
    public Object putAction() {
        return new ActionReturn(new EntityData("2", "resField", "hotresult"), (String) null);
    }

    public Object putAction(EntityReference reference, EntityView view) throws SQLException, RecentSubmissionsException {
        String input = "";
        try {
            input = readIStoString(requestGetter.getRequest().getInputStream());
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        Map<String, Object> decodedInput = new HashMap<String, Object>();
        EntityEncodingManager em = new EntityEncodingManager(null, null);
        decodedInput = em.decodeData(input, Formats.JSON); //TODO other formats

        for (String key : decodedInput.keySet()) {
            System.out.println("key - " + decodedInput.get(key));
        }

        System.out.println("PUT INPUT " + input);
        //String result = "none";
        Object result = new String("");
        String resField = "nofield";


        if (view.getPathSegments().length > 1) {
            String function = getMethod(view.getPathSegment(2), func2actionMapPUT_rev);
            System.out.println("working on function " + function);
            if (function != null) {
                resField = func2actionMapPUT.get(view.getPathSegment(2));
                System.out.println("resfield " + resField);
                Context context;
                try {
                    context = new Context();
                } catch (SQLException ex) {
                    throw new EntityException("Internal server error", "SQL error", 500);
                }
                refreshParams(context);
                System.out.println("refreshing done,reference " + reference.getId());
                //if (entityExists(reference.getId())) {
                //  CommunityEntity CE = new CommunityEntity(reference.getId(), context);
                Object CE = new Object();
                try {
                    CE = ctr.newInstance(reference.getId(), context);
                } catch (Exception ex) {
                    System.out.println("ne valja");
                }
//
//                try{ System.out.println("parameters found");
//                Class<?>[] kl = funcParamsPUT.get(view.getPathSegment(2));
//                for (Class<?> k : kl) {
//                    System.out.println(k.getName());
//                }} catch (Exception ex) {ex.printStackTrace(); }


                // ova metoda ovaj sistem za uzimanje parametara je ispravan
                try {
                    Method method = CE.getClass().getMethod(function, funcParamsPUT.get(view.getPathSegment(2)));
                    //Method method = CE.getClass().getMethod(function, new Class<?>[]{EntityView.class, Map.class, Context.class});
                    result = method.invoke(CE, view, decodedInput, context); // TODO more flexible for other param types
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                try {
                    removeConn(context);
                } catch (NullPointerException ex) {
                    // context already closed, ok
                }
            }
        }
        return new ActionReturn(new EntityData(reference.toString(), "resField", result), (String) null);
    }

    // the next two actions for view
    public Object testAction() {
        return new ActionReturn(new EntityData("2", "resField", "hotresult"), (String) null);
    }

    public void setRequestStorage(RequestStorage rStor) {
        this.reqStor = rStor;
    }

    public Object testAction(EntityReference reference, EntityView view) throws SQLException, RecentSubmissionsException {
        //String result = "none";
        Object result = new String("");
        String resField = "nofield";
        for (String segment : view.getPathSegments()) {
            System.out.println(segment);
        }
        System.out.println("areferenceee " + reference.getId());

        if (view.getPathSegments().length > 1) {
            String function = getMethod(view.getPathSegment(2), func2actionMapGET_rev);
            System.out.println("working on function " + function);
            if (function != null) {
                resField = func2actionMapGET.get(view.getPathSegment(2));
                System.out.println("resfield " + resField);
                Context context;
                try {
                    context = new Context();
                } catch (SQLException ex) {
                    throw new EntityException("Internal server error", "SQL error", 500);
                }
                refreshParams(context);
                System.out.println("refreshing done,reference " + reference.getId());
                //if (entityExists(reference.getId())) {
                //  CommunityEntity CE = new CommunityEntity(reference.getId(), context);
                Object CE = new Object();
                try {
                    CE = ctr.newInstance(reference.getId(), context);
                } catch (Exception ex) {
                    System.out.println("nevalja");
                }
                try {
                    Method method = CE.getClass().getMethod(function);
                    result = method.invoke(CE);
                    System.out.println("result " + result);
                } catch (Exception ex) {
                    System.out.println("line177");
                    ex.printStackTrace();
                }


                try {
                    removeConn(context);
                } catch (NullPointerException ex) {
                    // context already close, ok
                }
            }
        }
        return new ActionReturn(new EntityData(reference.toString(), "resField", result), (String) null);
    }
    protected EntityProviderManager entityProviderManager;

    public void setEntityProviderManager(EntityProviderManager entityProviderManager) {
        this.entityProviderManager = entityProviderManager;


    }

    public void init() throws Exception {
        entityProviderManager.registerEntityProvider(this);


    }

    public void destroy() throws Exception {
        entityProviderManager.unregisterEntityProvider(this);


    }

    /**
     * Extracts and returns information about current session user, for logging
     * @return
     */
    public String userInfo() {
        String ipaddr = "";


        try {
            ipaddr = this.entityProviderManager.getRequestGetter().getRequest().getRemoteAddr();


        } catch (NullPointerException ex) {
        }
        return "user:" + loggedUser + ":ip_addr=" + ipaddr + ":";


    }

    public String readIStoString(ServletInputStream is) throws IOException {
        /*
         * To convert the InputStream to String we use the BufferedReader.readLine()
         * method. We iterate until the BufferedReader return null which means
         * there's no more data to read. Each line will appended to a StringBuilder
         * and returned as String.
         */
        if (is != null) {
            StringBuilder sb = new StringBuilder();
            String line;

            try {
                BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                while ((line = reader.readLine()) != null) {
                    sb.append(line).append("\n");
                }
            } finally {
                is.close();
            }
            return sb.toString();
        } else {
            return "";
        }
    }

    public String readIStoString(InputStream is) throws IOException {
        /*
         * To convert the InputStream to String we use the BufferedReader.readLine()
         * method. We iterate until the BufferedReader return null which means
         * there's no more data to read. Each line will appended to a StringBuilder
         * and returned as String.
         */
        if (is != null) {
            StringBuilder sb = new StringBuilder();
            String line;

            try {
                BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                while ((line = reader.readLine()) != null) {
                    sb.append(line).append("\n");
                }
            } finally {
                is.close();
            }
            return sb.toString();
        } else {
            return "";
        }
    }

    /**
     * Checks request headers and applying requested format and login data
     * note that header based request has precedence over query one
     * This method is called before other methods processing request
     * so we can change some properties of response
     * @param view
     * @param req
     * @param res
     */
    public void before(EntityView view, HttpServletRequest req, HttpServletResponse res) {

        //    System.out.println("aaaaContent length = " + req.getContentLength());
        String input = "";
//        try {
//            ServletInputStream SI = req.getInputStream();
//            int i = SI.read();
//            while (i != -1) {
//                System.out.print((char) i);
//                i = SI.read();
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }

//        try {
//            input = readIStoString(req.getInputStream());
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }


//        System.out.println("THIS IS INPUT " + input);

//        while (req.getAttributeNames().hasMoreElements()) {
//            System.out.println("attr: " + req.getAttributeNames().nextElement());
//        }


        //      System.out.println("reference " + view.getEntityReference().getId());

//        while (req.getHeaderNames().hasMoreElements()) {
//            System.out.println("head: " + req.getHeaderNames().nextElement());
//        }
//
//        while (req.getParameterNames().hasMoreElements()) {
//            System.out.println("para: " + req.getParameterNames().nextElement());
//        }
        log.info(userInfo() + "starting to write for collection adding");
        Map<String, Object> daa = new HashMap<String, Object>();
//        EntityEncodingManager em = new EntityEncodingManager(null, null);
//        daa = em.decodeData(input, Formats.JSON);
//        System.out.println("OLD REQINPUT ");
//        for (String key : reqInput.keySet()) {
//            System.out.println(reqInput.get(key));
//        }
//        reqInput = em.decodeData(input, Formats.JSON);
//        System.out.println("NEW REQINPUT ");
//        for (String key : reqInput.keySet()) {
//            System.out.println(reqInput.get(key));
//        }
//        System.out.println("(_)_) daa" + daa.get("cid"));
//        String colid = "";
//        if (daa.get("cid") != null) {
//            colid = daa.get("cid").toString();
//        }
//        if (!colid.equals("")) {
//            Context context;
//            try {
//                context = new Context();
//            } catch (SQLException ex) {
//                throw new EntityException("Internal server error", "SQL error", 500);
//            }
//            refreshParams(context);
//
//            System.out.println(".adding collection to community." + colid + "int" + Integer.parseInt(colid));
//            try {
//                Collection col = Collection.find(context, Integer.parseInt(colid));
//                Community com = Community.find(context, Integer.parseInt(view.getEntityReference().getId()));
//                if ((com != null) && (col != null)) {
//                    com.addCollection(col);
//                } else {
//                    throw new EntityException("Entity not found", "Not found", 404);
//                }
//                //com.createCollection();
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//                throw new EntityException("111111Internal server error", "SQL error", 500);
//            } catch (AuthorizeException ex) {
//                ex.printStackTrace();
//            }
//
//
//            try {
//                removeConn(context);
//            } catch (NullPointerException ex) {
//                // context already close, ok
//            }
//        }


        //       Map<Object, Object> para = req.getParameterMap();
        //       for (Object key : para.keySet()) {
        //           System.out.println("~~~~~ key " + key + " val " + para.get(key));
        //       }

        // json by default if nothing is requested
        try {
            if (req.getContentType().equals("application/json")) {
                view.setExtension("json");


            } else if (req.getContentType().equals("application/xml")) {
                view.setExtension("xml");


            } else {
                view.setExtension("json");


            }
        } catch (Exception ex) {
            if (view.getFormat().equals("xml")) {
                view.setExtension("xml");


            } else {
                view.setExtension("json");


            }
        }

        /**
         * Check user/login data in header and apply if present
         */
        try {
            if (!(req.getHeader("user").isEmpty() && req.getHeader("pass").isEmpty())) {
                userc = req.getHeader("user");
                passc = req.getHeader("pass");


            }
        } catch (NullPointerException nu) {
            userc = "";
            passc = "";


        }
    }

    /**
     * Called after processing of request
     * Not relevant in this case but implementation must be available
     * @param view
     * @param req
     * @param res
     */
    public void after(EntityView view, HttpServletRequest req, HttpServletResponse res) {
    }

    /**
     * Extract parameters from query and do basic authentication, analyze
     * and prepare sorting and other fields
     * @param context current database context locally (in subclass method)
     * defined but used here for loging and other purposes
     */
    public UserRequestParams refreshParams(Context context) {

        UserRequestParams uparam = new UserRequestParams();

        /**
         * now check user login info and try to register
         */
        try {
            user = reqStor.getStoredValue("user").toString();
        } catch (NullPointerException ex) {
            user = "";
        }

        try {
            pass = reqStor.getStoredValue("pass").toString();
        } catch (NullPointerException ex) {
            pass = "";
        }

        // these are from header - have priority
        try {
            if (!(userc.isEmpty() && passc.isEmpty())) {
                user = userc;
                pass = passc;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } // now try to login user
        loggedUser = "anonymous";


        try {
            EPerson eUser = EPerson.findByEmail(context, user);
            if ((eUser.canLogIn()) && (eUser.checkPassword(pass))) {
                context.setCurrentUser(eUser);
                loggedUser = eUser.getName();
            } else {
                throw new EntityException("Bad username or password", user, 403);
            }
        } catch (SQLException sql) {
            System.out.println(sql.toString());
            sql.printStackTrace();
        } catch (AuthorizeException auth) {
            throw new EntityException("Unauthorised", user, 401);

// TODO Refactor this, it seems the catching of usernames/passwords does not work


        } catch (NullPointerException ne) {
            if (!(user.equals("") && pass.equals(""))) {
                throw new EntityException("Bad username or password", user, 403);
            }
        }

        try {
            this.idOnly = reqStor.getStoredValue("idOnly").equals("true");
            uparam.setIdOnly(true);
        } catch (NullPointerException ex) {
            idOnly = false;
        }

        try {
            this.immediateOnly = reqStor.getStoredValue("immediateOnly").equals("false");
            uparam.setImmediateOnly(false);
        } catch (NullPointerException ex) {
            immediateOnly = true;
        }

        try {
            this.topLevelOnly = !(reqStor.getStoredValue("topLevelOnly").equals("false"));
            uparam.setTopLevelOnly(false);
        } catch (NullPointerException ex) {
            topLevelOnly = true;
        }

        try {
            query = reqStor.getStoredValue("query").toString();
            uparam.setQuery(query);
        } catch (NullPointerException ex) {
            query = "";
        }

        try {
            in_archive = reqStor.getStoredValue("in_archive").toString().equalsIgnoreCase("true");
            uparam.setInArchive(true);
        } catch (NullPointerException ex) {
            in_archive = false;

        }
        /**
         * these are fields based on RoR conventions
         */
        try {
            _order = reqStor.getStoredValue("_order").toString();
            uparam.setOrder(_order);
        } catch (NullPointerException ex) {
            _order = "";
        }

        try {
            _sort = reqStor.getStoredValue("_sort").toString();
            uparam.setSort(_sort);
        } catch (NullPointerException ex) {
            _sort = "";


        } // both parameters are used according to requirements
        if (_order.length() > 0 && _sort.equals("")) {
            _sort = _order;
        }

        try {
            _start = Integer.parseInt(reqStor.getStoredValue("_start").toString());
            uparam.setStart(_start);
        } catch (NullPointerException ex) {
            _start = 0;
        }

        try {
            _page = Integer.parseInt(reqStor.getStoredValue("_page").toString());
            uparam.setPage(_page);
        } catch (NullPointerException ex) {
            _page = 0;
        }

        try {
            _perpage = Integer.parseInt(reqStor.getStoredValue("_perpage").toString());
            uparam.setPerPage(_perpage);
        } catch (NullPointerException ex) {
            _perpage = 0;
        }

        try {
            _limit = Integer.parseInt(reqStor.getStoredValue("_limit").toString());
            uparam.setLimit(_limit);
        } catch (NullPointerException ex) {
            _limit = 0;
        } // some checking for invalid values

        if (_page < 0) {
            _page = 0;
        }
        if (_perpage < 0) {
            _perpage = 0;
        }
        if (_limit < 0) {
            _limit = 0;
        }


        try {
            _sdate = reqStor.getStoredValue("startdate").toString();
            uparam.setSDate(_sdate);
        } catch (NullPointerException ex) {
            _sdate = null;
        }

        try {
            _edate = reqStor.getStoredValue("enddate").toString();
            uparam.setEDate(_edate);
        } catch (NullPointerException ex) {
            _edate = null;
        }

        try {
            withdrawn = reqStor.getStoredValue("withdrawn").toString().equalsIgnoreCase("true");
            uparam.setWithdrawn(withdrawn);
        } catch (NullPointerException ex) {
            withdrawn = false;
        }

        try {
            String detail = reqStor.getStoredValue("detail").toString();
            if (detail.equals("minimum")) {
                uparam.setDetail(UtilHelper.DEPTH_MINIMAL);
            } else if (detail.equals("standard")) {
                uparam.setDetail(UtilHelper.DEPTH_STANDARD);
            } else if (detail.equals("extended")) {
                uparam.setDetail(UtilHelper.DEPTH_EXTENDED);
            }
        } catch (NullPointerException ex) {
        }


        // defining sort fields and values
        _sort = _sort.toLowerCase();
        String[] sort_arr = _sort.split(",");

        for (String option : sort_arr) {
            if (option.startsWith("submitter")) {
                sortOptions.add(UtilHelper.SORT_SUBMITTER);
            } else if (option.startsWith("lastname")) {
                sortOptions.add(UtilHelper.SORT_LASTNAME);
            } else if (option.startsWith("fullname")) {
                sortOptions.add(UtilHelper.SORT_FULL_NAME);
            } else if (option.startsWith("language")) {
                sortOptions.add(UtilHelper.SORT_LANGUAGE);
            } else if (option.startsWith("lastmodified")) {
                sortOptions.add(UtilHelper.SORT_LASTMODIFIED);
            } else if (option.startsWith("countitems")) {
                sortOptions.add(UtilHelper.SORT_COUNT_ITEMS);
            } else if (option.startsWith("name")) {
                sortOptions.add(UtilHelper.SORT_NAME);
            } else {
                sortOptions.add(UtilHelper.SORT_ID);
            }
            if ((option.endsWith("_desc") || option.endsWith("_reverse"))) {
                int i = sortOptions.get(sortOptions.size() - 1);
                sortOptions.remove(sortOptions.size() - 1);
                i += 100;
                sortOptions.add(i);
            }
        }

        int intcommunity = 0;


        int intcollection = 0;

        // integer values used in some parts


        try {
            intcommunity = Integer.parseInt(reqStor.getStoredValue("community").toString());
        } catch (NullPointerException nul) {
        }

        try {
            _community = Community.find(context, intcommunity);


        } catch (NullPointerException nul) {
        } catch (SQLException sql) {
        }

        try {
            intcollection = Integer.parseInt(reqStor.getStoredValue("collection").toString());


        } catch (NullPointerException nul) {
        }

        try {
            _collection = Collection.find(context, intcollection);


        } catch (NullPointerException nul) {
        } catch (SQLException sql) {
        }

        if ((intcommunity > 0) && (intcollection > 0)) {
            throw new EntityException("Bad request", "Community and collection selected", 400);


        }

        if ((intcommunity > 0) && (_community == null)) {
            throw new EntityException("Bad request", "Unknown community", 400);


        }

        if ((intcollection > 0) && (_collection == null)) {
            throw new EntityException("Bad request", "Unknown collection", 400);


        }

        return uparam;
    }

    public String[] getHandledInputFormats() {
        return new String[]{Formats.HTML, Formats.XML, Formats.JSON};
    }

    public Object translateFormattedData(EntityReference ref, String format, InputStream input, Map<String, Object> params) {
        String IS = "";
        try {
            IS = readIStoString(input);
            System.out.println("is+= " + IS);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        Map<String, Object> decodedInput = new HashMap<String, Object>();
        EntityEncodingManager em = new EntityEncodingManager(null, null);
        if (format.equals("xml")) {
            decodedInput = em.decodeData(IS, Formats.XML); //TODO other formats
        } else {
            decodedInput = em.decodeData(IS, Formats.JSON); //TODO other formats
        }


        System.out.println("== translate formated data called");
        System.out.println("got: \n" + IS + "\ndecoded " + decodedInput);
        return decodedInput;
    }

    /**
     * Remove items from list in order to display only requested items
     * (according to _start, _limit etc.)
     * @param entities
     */
    public void removeTrailing(List<?> entities) {
        if ((_start > 0) && (_start < entities.size())) {
            for (int x = 0; x
                    < _start; x++) {
                entities.remove(x);


            }
        }
        if (_perpage > 0) {
            entities.subList(0, _page * _perpage).clear();


        }
        if ((_limit > 0) && entities.size() > _limit) {
            entities.subList(_limit, entities.size()).clear();


        }
    }

    /**
     * Complete connection in order to lower load of sql server
     * this way it goes faster and prevents droppings with higher load
     * @param context
     */
    public void removeConn(Context context) {
        // close connection to prevent connection problems
        try {
            context.complete();
        } catch (SQLException ex) {
        }
    }

    public void setRequestGetter(RequestGetter requestGetter) {
        this.requestGetter = requestGetter;
    }

    public String[] getHandledOutputFormats() {
        return new String[]{Formats.JSON, Formats.XML, Formats.FORM, Formats.ATOM};

    }

    public void addParameters(String function, Class<?>[] parameters, Map<String, Class<?>[]> mappings_parameters) {
        mappings_parameters.put(function, parameters);
    }

    public Class<?>[] getParameters(String function, Map<String, Class<?>[]> mappings_parameters) {
        return mappings_parameters.get(function);
    }

    public void addMethod(String field, String function, Map<String, String> mappings_rev) {
        mappings_rev.put(field, function);
    }

    public String getMethod(String field, Map<String, String> mappings_rev) {
        return mappings_rev.get(field);
    }

    public Object getEntity(EntityReference reference) {
        String segments[] = {};

        System.out.println("Abstract get entity");
        if (reqStor.getStoredValue("pathInfo") != null) {
            segments = reqStor.getStoredValue("pathInfo").toString().split("/", 10);
        }

        if (segments[3].lastIndexOf(".") > 0) {
            segments[3] = segments[3].substring(0, segments[3].lastIndexOf("."));
        }

        if (func2actionMapGET_rev.containsKey(segments[3])) {
            Object result;
            String function = getMethod(segments[3], func2actionMapGET_rev);
            Context context;
            try {
                context = new Context();
            } catch (SQLException ex) {
                throw new EntityException("Internal server error", "SQL error", 500);
            }

            UserRequestParams uparams;
            uparams = refreshParams(context);

            Object CE = new Object();
            try {

                CE = entityConstructor.newInstance(reference.getId(), context, 1, uparams);
            } catch (Exception ex) {
                throw new EntityException("Internal server error", "Cannot create entity", 500);
            }

            try {
                Method method = CE.getClass().getMethod(function, new Class<?>[]{});
                //Method method = CE.getClass().getMethod(function, new Class<?>[]{EntityView.class, Map.class, Context.class});
                result = method.invoke(CE); // TODO more flexible for other param types
            } catch (Exception ex) {
                throw new EntityException("Internal server error", "Cannot call method " + function, 500);
            }

            try {
                removeConn(context);
            } catch (NullPointerException ex) {
                // context already closed, ok
            }
            return result;
        } else {
            throw new EntityException("Bad request", "Method not supported " + segments[3], 400);
        }
    }

    public void deleteEntity(EntityReference ref, Map<String, Object> params) {
        String segments[] = {};
        String action = "";
        Map<String, Object> inputVar = new HashMap<String, Object>();
        System.out.println("Delete called");

        if (reqStor.getStoredValue("pathInfo") != null) {
            segments = reqStor.getStoredValue("pathInfo").toString().split("/", 32);
        }


        for (int x = 0; x < segments.length; x++) {
            switch (x) {
                case 1:
                    inputVar.put("base", segments[x]);
                    break;
                case 2:
                    inputVar.put("id", segments[x]);
                    break;
                case 3:
                    inputVar.put("element", segments[x]);
                    break;
                case 4:
                    inputVar.put("eid", segments[x]);
                    break;
                case 5:
                    inputVar.put("trail", segments[x]);
                    break;
                default:
                    break;
            }
        }

        if (segments.length > 3) {
            action = segments[3];
        }

        if (func2actionMapDELETE_rev.containsKey(action)) {
            System.out.println("contains key called");
            String function = getMethod(action, func2actionMapDELETE_rev);
            if (function == null) {
                throw new EntityException("Bad request", "Method not supported - not defined", 400);
            }
            Context context;
            try {
                context = new Context();
            } catch (SQLException ex) {
                throw new EntityException("Internal server error", "SQL error", 500);
            }

            UserRequestParams uparams;
            uparams = refreshParams(context);

            System.out.print("uparams " + uparams.getUser() + uparams.getPassword());
            Object CE = new Object();
            try {
                CE = entityConstructor.newInstance(ref.getId(), context, 1, uparams);
            } catch (Exception ex) {
                throw new EntityException("Internal server error", "Cannot create entity", 500);
            }

            try {
                Method method = CE.getClass().getMethod(function, funcParamsDELETE.get(action));
                method.invoke(CE, ref, inputVar, context); // TODO more flexible for other param types
            } catch (NoSuchMethodException nex) {
                System.out.println("nex");
            } catch (IllegalAccessException iex) {
                System.out.println("iex");
            } catch (InvocationTargetException itex) {
                EntityException eex = (EntityException) itex.getTargetException();
                if (itex.getTargetException().getClass().equals(EntityException.class)) {
                    throw eex;
                } else {
                    // TODO UNKNOWN ERROR - OTHER CLASS - REPORT
                }
            }

            try {
                removeConn(context);
            } catch (NullPointerException ex) {
                // context already closed, ok
            }
        } else if (action.equals("")) {
            System.out.println("action equal");
            String function = getMethod(action, func2actionMapDELETE_rev);
            if (function == null) {
                throw new EntityException("Bad request", "Method not supported - not defined", 400);
            }
            Context context;
            try {
                context = new Context();
            } catch (SQLException ex) {
                throw new EntityException("Internal server error", "SQL error", 500);
            }

            UserRequestParams uparams;
            uparams = refreshParams(context);

            Object CE = new Object();
            try {
                CE = entityConstructor.newInstance(ref.getId(), context, 1, uparams);
            } catch (Exception ex) {
                throw new EntityException("Internal server error", "Cannot create entity", 500);
            }

            try {
                Method method = CE.getClass().getMethod(function, funcParamsDELETE.get(action));
                method.invoke(CE, ref, inputVar, context); // TODO more flexible for other param types
            } catch (Exception ex) {
                throw new EntityException("Internal server error", "Cannot call method " + function, 500);
            }

            try {
                removeConn(context);
            } catch (NullPointerException ex) {
                // context already closed, ok
            }
        } else {
            throw new EntityException("Bad request", "Method not supported " + action, 400);
        }
    }

    public void updateEntity(EntityReference ref, Object entity, Map<String, Object> params) {
        System.out.println("update called");
        Map<String, Object> inputVar = (HashMap) entity;
        String segments[] = {};
        if (params.containsKey("pathInfo")) {
            segments = params.get("pathInfo").toString().split("/", 10);
        }
        //System.out.println("calling update");

        if (segments.length > 3) {


            if (segments[3].lastIndexOf(".") > 0) {
                segments[3] = segments[3].substring(0, segments[3].lastIndexOf("."));
            }

            System.out.println("length > 3" + segments[2] + ".." + segments[3]);

            if (func2actionMapPUT_rev.containsKey(segments[3])) {
                //System.out.println("got in");

                String function = getMethod(segments[3], func2actionMapPUT_rev);
                Context context;
                try {
                    context = new Context();
                } catch (SQLException ex) {
                    throw new EntityException("Internal server error", "SQL error", 500);
                }

                UserRequestParams uparams;
                uparams = refreshParams(context);
                Object CE = new Object();

                try {
                    CE = entityConstructor.newInstance(ref.getId(), context, 1, uparams);
                } catch (Exception ex) {
                    throw new EntityException("Internal server error", "Cannot create entity", 500);
                }

                try {
                    Method method = CE.getClass().getMethod(function, funcParamsPUT.get(segments[3]));
                    method.invoke(CE, ref, inputVar, context); // TODO more flexible for other param types
                    // System.out.println("invoked");
                } catch (InvocationTargetException ex) {
                    if (ex.getCause() != null) {
                        throw (RuntimeException) ex.getCause();
                    } else {
                        throw new EntityException("Internal server error", "Unknown error", 500);
                    }
                } catch (NoSuchMethodException ex) {
                    throw new EntityException("Not found", "Meethod not supported " + segments[3], 404);
                } catch (IllegalAccessException ex) {
                    throw new EntityException("Internal server error", "Cannot call method " + function, 500);
                }
                try {
                    removeConn(context);

                } catch (NullPointerException ex) {
                    // context already closed, ok
                }
            } else {
                //  System.out.println(segments[0] + ":" + segments[1] + ":" + segments[2] + ":" + segments[3]);
                for (String key : func2actionMapPUT_rev.keySet()) {
                    System.out.println(key + " " + func2actionMapPUT_rev.get(key));
                }
//
                for (String key : func2actionMapPUT.keySet()) {
                    System.out.println(key + " " + func2actionMapPUT.get(key));
                }
                throw new EntityException("Bad request", "Maethod not supported " + segments[3], 400);
            }
        }
    }

    public String createEntity(EntityReference ref, Object entity, Map<String, Object> params) {
        System.out.println("creating");
        String result = "x";
        Map<String, Object> inputVar = (HashMap) entity;
        String action = "";
        String function = "";
        String[] mandatory_params = {};
        try {
            inputVar.get("action").getClass().getName();
        } catch (NullPointerException ex) {
            throw new EntityException("Bad request", "Incomplete request [action]", 400);
        }
        try {
            action = (String) inputVar.get("action");
        } catch (ClassCastException ex2) {
            throw new EntityException("Bad request", "Incomplete request [action2]", 400);
        }


        if (func2actionMapPOST_rev.get(action) != null) {
            System.out.println("found " + func2actionMapPOST_rev.get("create"));
            function = func2actionMapPOST_rev.get(action);
            mandatory_params = inputParamsPOST.get(function);
        }

        for (String param : mandatory_params) {
            if (inputVar.get(param) == null) {
                throw new EntityException("Bad request", "Incomplete request [mandatory param]", 400);
            }
        }

        Context context;
        try {
            context = new Context();
        } catch (SQLException ex) {
            throw new EntityException("Internal server error", "SQL error", 500);
        }

        UserRequestParams uparams;
        uparams = refreshParams(context);
        Object CE = new Object();
        System.out.println("id izabran " + ref.getId());
        try {
            CE = entityConstructor.newInstance(ref.getId(), context, 1, uparams);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new EntityException("Internal server error", "aCannot create entity", 500);
        }

        try {
            Method method = CE.getClass().getMethod(function, funcParamsPOST.get(action));
            result = (String) method.invoke(CE, ref, inputVar, context); // TODO more flexible for other param types
            // System.out.println("invoked");
        } catch (InvocationTargetException ex) {
            if (ex.getCause() != null) {
                throw (RuntimeException) ex.getCause();
            } else {
                throw new EntityException("Internal server error", "Unknown error", 500);
            }
        } catch (NoSuchMethodException ex) {
            throw new EntityException("Not found", "Method not supported ", 404);
        } catch (IllegalAccessException ex) {
            throw new EntityException("Internal server error", "Cannot call method " + function, 500);
        }
        try {
            removeConn(context);

        } catch (NullPointerException ex) {
            // context already closed, ok
        }



        return result;



    }
}
