/*
 * ForgotPasswordFinished.java
 *
 * Version: $Revision: 3705 $
 *
 * Date: $Date: 2009-04-11 18:02:24 +0100 (Sat, 11 Apr 2009) $
 *
 * Copyright (c) 2002, Hewlett-Packard Company and Massachusetts
 * Institute of Technology.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * - Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *
 * - Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * - Neither the name of the Hewlett-Packard Company nor the name of the
 * Massachusetts Institute of Technology nor the names of their
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
 * TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

package org.dspace.app.xmlui.aspect.eperson;

import org.dspace.app.xmlui.cocoon.AbstractDSpaceTransformer;
import org.dspace.app.xmlui.wing.Message;
import org.dspace.app.xmlui.wing.WingException;
import org.dspace.app.xmlui.wing.element.Body;
import org.dspace.app.xmlui.wing.element.Division;
import org.dspace.app.xmlui.wing.element.PageMeta;

/**
 * Display to the user that their password has been successfully reset.
 * 
 * @author Scott Phillips
 */

public class ForgotPasswordFinished extends AbstractDSpaceTransformer
{
    private static final Message T_title =
        message("xmlui.EPerson.ForgotPasswordFinished.title");
    
    private static final Message T_dspace_home =
        message("xmlui.general.dspace_home");
    
    private static final Message T_trail_forgot_password =
        message("xmlui.EPerson.trail_forgot_password");
    
    private static final Message T_head =
        message("xmlui.EPerson.ForgotPasswordFinished.head");
    
    private static final Message T_para1 =
        message("xmlui.EPerson.ForgotPasswordFinished.para1");
    
    private static final Message T_go_home =
        message("xmlui.general.go_home");
    
  public void addPageMeta(PageMeta pageMeta) throws WingException 
  {
      // Set the page title
      pageMeta.addMetadata("title").addContent(T_title);
    
      pageMeta.addTrailLink(contextPath + "/",T_dspace_home);
      pageMeta.addTrail().addContent(T_trail_forgot_password);
  }
  
    public void addBody(Body body) throws WingException
    {
        Division reset = body.addDivision("password-reset", "primary");
        
        reset.setHead(T_head);
        
        EPersonUtils.forgottProgressList(reset, 3);
        
        reset.addPara(T_para1);
        
        reset.addPara().addXref(contextPath, T_go_home);
    }

}
