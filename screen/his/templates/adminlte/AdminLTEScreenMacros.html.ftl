<#include "DefaultScreenMacros.html.ftl"/>
<#-- ================ AdminLTE左侧菜单 ================ -->
<#macro "left-side">
      <!-- Left side column. contains the sidebar --> 
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <ul class="sidebar-menu"> 
            <li class="header">主菜单</li>          
            <#recurse>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>      
</#macro>
<#--一级菜单-->
<#macro "left-tree-nodes">
    <#assign linkNode = .node>
    <#assign curUrl = ec.resource.evaluateStringExpand(linkNode["@url"], "#")>
    <#assign textLocation = ec.resource.evaluateStringExpand(linkNode["@location"], "")>
    <#assign subMenus =sri.sfi.getScreenDefinition(textLocation).getMenuSubscreensItems()>
    <#assign currentScreenPath = ec.resource.evaluateStringExpand(linkNode["@currentScreenPath"], "#")>
    <#assign urlInstance = sri.buildUrl(currentScreenPath)>
    <#--<#assign subMenuNum =subMenus.size()>-->
    <#assign subMenuNum =0>
            <#list subMenus as subscreensItem>   
                <#assign currentScreenDef = sri.sfi.getScreenDefinition(subscreensItem.location)>   
                <#assign currentUrlInfo = sri.buildUrl(currentScreenPath+"/${subscreensItem.name}")>   
                <#if currentUrlInfo.isPermitted()>     
                    <#if !currentScreenDef.hasRequiredParameters()>
                        <#assign subMenuNum = subMenuNum + 1>
                    </#if>                
                </#if>
            </#list>
    <#if sri.buildUrl(currentScreenPath).inCurrentScreenPath>
        <#if subMenuNum gt 0>
            <li class="active treeview">
              <a href="#">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                 <span>${ec.resource.evaluateStringExpand(linkNode["@text"], "")}</span>
                 <i class="fa fa-angle-left pull-right"></i> 
              </a>
              <ul class="treeview-menu menu-open">
                <#recurse>
              </ul>
            </li>
        <#else>
            <li class="active">
              <a href="${ec.resource.evaluateStringExpand(linkNode["@url"], "#")}">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if> 
                <span>${ec.resource.evaluateStringExpand(linkNode["@text"], "")} </span> 
                <!--<i class="fa fa-angle-left pull-right"></i>-->
              </a>
            </li>        
        </#if>
    <#else>
        <#if subMenuNum gt 0>
             <li class="treeview">
              <a href="#">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                 <span>${ec.resource.evaluateStringExpand(linkNode["@text"], "")}</span>
                 <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">       
                <#recurse>
              </ul>
            </li> 
        <#else>
            <li>
              <a href="${ec.resource.evaluateStringExpand(linkNode["@url"], "#")}">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                <span>${ec.resource.evaluateStringExpand(linkNode["@text"], "")} </span> 
                <#--<small class="label pull-right bg-green">new</small>-->
              </a>
            </li>         
        </#if>
    </#if>
</#macro>
<#--二到N级菜单-->
<#macro "left-tree-subnodes">
    <#assign linkNode = .node>
    <#assign curUrl = ec.resource.evaluateStringExpand(linkNode["@url"], "#")>
    <#assign currentScreenPath = ec.resource.evaluateStringExpand(linkNode["@currentScreenPath"], "#")>
    <#assign textLocation = ec.resource.evaluateStringExpand(linkNode["@location"], "")>
    <#assign subMenus =sri.sfi.getScreenDefinition(textLocation).getMenuSubscreensItems()>
    <#assign urlInstance = sri.buildUrl(currentScreenPath)>
    <#--<#assign subMenuNum =subMenus.size()>-->
    <#assign subMenuNum =0>
            <#list subMenus as subscreensItem>   
                <#assign currentScreenDef = sri.sfi.getScreenDefinition(subscreensItem.location)>   
                <#assign currentUrlInfo = sri.buildUrl(currentScreenPath+"/${subscreensItem.name}")>   
                <#if currentUrlInfo.isPermitted()>     

                    <#if !currentScreenDef.hasRequiredParameters()>
                        <#assign subMenuNum = subMenuNum + 1>
                    </#if>                
                </#if>
            </#list>
<#--${subMenuNum}-->
    <#--${textLocation}-->
<#--${sri.screenUrlInfo.toString()}----${currentScreenPath}-->
    <#if sri.buildUrl(currentScreenPath).inCurrentScreenPath>
        <#if subMenuNum gt 0>
                <li class="active">
                  <a href="#">

                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">

                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                   ${ec.resource.evaluateStringExpand(linkNode["@text"], "")}
                      <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu menu-open">
                    <#recurse>
                  </ul>
                </li>
        <#else>
        <li class="active">
            <a href="${ec.resource.evaluateStringExpand(linkNode["@url"], "#")}">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
            ${ec.resource.evaluateStringExpand(linkNode["@text"], "")}
            </a>
        </li>
        </#if>
    <#else> 
        <#if subMenuNum gt 0>
                <li>
                  <a href="#">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
                   ${ec.resource.evaluateStringExpand(linkNode["@text"], "")}
                      <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu"> 
                    <#recurse>
                  </ul>
                </li>
        <#else>
        <li>
            <a href="${ec.resource.evaluateStringExpand(linkNode["@url"], "#")}">
                 <#if urlInstance.sui.menuImage?has_content>
                      <#if urlInstance.sui.menuImageType == "icon">
                          <i class="${urlInstance.sui.menuImage}" style="padding-right: 8px;"></i>
                      <#elseif urlInstance.sui.menuImageType == "url-plain">
                          <img src="${urlInstance.sui.menuImage}" width="18" style="padding-right: 4px;"/>
                      <#else>
                          <img src="${sri.buildUrl(urlInstance.sui.menuImage).url}" height="18" style="padding-right: 4px;"/>
                      </#if>
                 <#else>
                      <i class="glyphicon glyphicon-link" style="padding-right: 8px;"></i>
                 </#if>
            ${ec.resource.evaluateStringExpand(linkNode["@text"], "")}
            </a>
        </li>
        </#if>
    </#if>
</#macro> 



<#macro "container-box">
    <#assign divId><@nodeId .node/></#assign>
    <div class="box box-info"<#if divId??> id="${divId}"</#if>>
        <div class="box-header ui-sortable-handle" style="cursor: move;">
              <!--<i class="fa fa-envelope"></i>-->
            <#recurse .node["box-header"][0]>

            <#if .node["box-toolbar"]?has_content>
                <div class="box-tools ">
                    <#recurse .node["box-toolbar"][0]>
                </div>
            </#if>
        </div>
        <div class="box-body">
            <#recurse .node["box-body"][0]>
        </div>
    </div>
</#macro>


<#-- ======================= Form ========================= -->
<#macro "form-single">
<#if sri.doBoundaryComments()><!-- BEGIN form-single[@name=${.node["@name"]}] --></#if>
    <#-- Use the formNode assembled based on other settings instead of the straight one from the file: -->
    <#assign formNode = sri.getFtlFormNode(.node["@name"])>
    ${sri.pushSingleFormMapContext(formNode)}
    <#assign skipStart = (formNode["@skip-start"]! == "true")>
    <#assign skipEnd = (formNode["@skip-end"]! == "true")>
    <#assign urlInstance = sri.makeUrlByType(formNode["@transition"], "transition", null, "true")>
    <#assign formId>${ec.resource.expand(formNode["@name"], "")}<#if sectionEntryIndex?has_content>_${sectionEntryIndex}</#if></#assign>
    <#assign inFieldRow = false>
    <#assign bigRow = false>
    <#if !skipStart>
    <form name="${formId}" id="${formId}" class="validation-engine-init" method="post" action="${urlInstance.url}"<#if sri.isFormUpload(formNode["@name"])> enctype="multipart/form-data"</#if>>
        <input type="hidden" name="moquiFormName" value="${formNode["@name"]}">
        <input type="hidden" name="moquiSessionToken" value="${(ec.web.sessionToken)!}">
    </#if>
        <fieldset class="form-horizontal"><#-- was form-single-outer -->
    <#if formNode["field-layout"]?has_content>
        <#assign fieldLayout = formNode["field-layout"][0]>
            <#assign accordionId = fieldLayout["@id"]?default(formId + "-accordion")>
            <#assign collapsible = (fieldLayout["@collapsible"]! == "true")>
            <#assign active = fieldLayout["@active"]!>
            <#assign collapsibleOpened = false>
            <#list formNode["field-layout"][0]?children as layoutNode>
                <#if layoutNode?node_name == "field-ref">
                  <#if collapsibleOpened>
                    <#assign collapsibleOpened = false>
                    </div><!-- /collapsible accordionId ${accordionId} -->
                    <#assign afterFormScript>
                        $("#${accordionId}").accordion({ collapsible: true,<#if active?has_content> active: ${active},</#if> heightStyle: "content" });
                    </#assign>
                    <#t>${sri.appendToScriptWriter(afterFormScript)}
                    <#assign accordionId = accordionId + "_A"><#-- set this just in case another accordion is opened -->
                  </#if>
                    <#assign fieldRef = layoutNode["@name"]>
                    <#assign fieldNode = "invalid">
                    <#list formNode["field"] as fn><#if fn["@name"] == fieldRef><#assign fieldNode = fn><#break></#if></#list>
                    <#if fieldNode == "invalid">
                        <div>Error: could not find field with name [${fieldRef}] referred to in a field-ref.@name attribute.</div>
                    <#else>
                        <@formSingleSubField fieldNode/>
                    </#if>
                <#elseif layoutNode?node_name == "fields-not-referenced">
                    <#assign nonReferencedFieldList = sri.getFtlFormFieldLayoutNonReferencedFieldList(.node["@name"])>
                    <#list nonReferencedFieldList as nonReferencedField><@formSingleSubField nonReferencedField/></#list>
                <#elseif layoutNode?node_name == "field-row">
                  <#if collapsibleOpened>
                    <#assign collapsibleOpened = false>
                    </div><!-- /collapsible accordionId ${accordionId} -->
                    <#assign afterFormScript>
                        $("#${accordionId}").accordion({ collapsible: true,<#if active?has_content> active: ${active},</#if> heightStyle: "content" });
                    </#assign>
                    <#t>${sri.appendToScriptWriter(afterFormScript)}
                    <#assign accordionId = accordionId + "_A"><#-- set this just in case another accordion is opened -->
                  </#if>
                    <div class="row"><#-- was field-row -->
                    <#assign inFieldRow = true>
                    <#list layoutNode?children as rowChildNode>
                        <#if rowChildNode?node_name == "field-ref">
                            <div class="col-lg-6"><#-- was field-row-item -->
                                <#assign fieldRef = rowChildNode["@name"]>
                                <#assign fieldNode = "invalid">
                                <#list formNode["field"] as fn><#if fn["@name"] == fieldRef><#assign fieldNode = fn><#break></#if></#list>
                                <#if fieldNode == "invalid">
                                    <div>Error: could not find field with name [${fieldRef}] referred to in a field-ref.@name attribute.</div>
                                <#else>
                                    <@formSingleSubField fieldNode/>
                                </#if>
                            </div><!-- /col-lg-6 not bigRow -->
                        <#elseif rowChildNode?node_name == "fields-not-referenced">
                            <#assign nonReferencedFieldList = sri.getFtlFormFieldLayoutNonReferencedFieldList(.node["@name"])>
                            <#list nonReferencedFieldList as nonReferencedField><@formSingleSubField nonReferencedField/></#list>
                        </#if>
                    </#list>
                    <#assign inFieldRow = false>
                    </div><#-- /row -->
                <#elseif layoutNode?node_name == "field-row-big">
                    <#if collapsibleOpened>
                        <#assign collapsibleOpened = false>
                    </div><!-- /collapsible accordionId ${accordionId} -->
                        <#assign afterFormScript>
                            $("#${accordionId}").accordion({ collapsible: true,<#if active?has_content> active: ${active},</#if> heightStyle: "content" });
                        </#assign>
                        <#t>${sri.appendToScriptWriter(afterFormScript)}
                        <#assign accordionId = accordionId + "_A"><#-- set this just in case another accordion is opened -->
                    </#if>
                    <#assign inFieldRow = true>
                    <#assign bigRow = true>
                    <#-- funny assign here to not render row if there is no content -->
                    <#assign rowContent>
                        <#list layoutNode?children as rowChildNode>
                            <#if rowChildNode?node_name == "field-ref">
                                <#assign fieldRef = rowChildNode["@name"]>
                                <#assign fieldNode = "invalid">
                                <#list formNode["field"] as fn><#if fn["@name"] == fieldRef><#assign fieldNode = fn><#break></#if></#list>
                                <#if fieldNode == "invalid">
                                    <div>Error: could not find field with name [${fieldRef}] referred to in a field-ref.@name attribute.</div>
                                <#else>
                                    <@formSingleSubField fieldNode/>
                                </#if>
                            <#elseif rowChildNode?node_name == "fields-not-referenced">
                                <#assign nonReferencedFieldList = sri.getFtlFormFieldLayoutNonReferencedFieldList(.node["@name"])>
                                <#list nonReferencedFieldList as nonReferencedField><@formSingleSubField nonReferencedField/></#list>
                            </#if>
                        </#list>
                    </#assign>
                    <#assign rowContent = rowContent?trim>
                    <#if rowContent?has_content>
                    <div class="form-group"><#-- was row -->
                        <#if layoutNode["@title"]?has_content>
                        <label class="control-label col-lg-2">${ec.resource.expand(layoutNode["@title"], "")}</label>
                        <div class="col-lg-10">
                        <#else>
                        <div class="col-lg-12">
                        </#if>
                            ${rowContent}
                        </div><#-- /col-lg-12 bigRow -->
                    </div><#-- /row -->
                    </#if>
                    <#assign bigRow = false>
                    <#assign inFieldRow = false>
                <#elseif layoutNode?node_name == "field-group">
                  <#if collapsible && !collapsibleOpened><#assign collapsibleOpened = true>
                    <div id="${accordionId}">
                  </#if>
                    <h3><a href="#">${layoutNode["@title"]?default("Section " + layoutNode_index)}</a></h3>
                    <div<#if layoutNode["@style"]?has_content> class="${layoutNode["@style"]}"</#if>>
                        <#list layoutNode?children as groupNode>
                            <#if groupNode?node_name == "field-ref">
                                <#assign fieldRef = groupNode["@name"]>
                                <#assign fieldNode = "invalid">
                                <#list formNode["field"] as fn><#if fn["@name"] == fieldRef><#assign fieldNode = fn><#break></#if></#list>
                                <#if fieldNode == "invalid">
                                    <div>Error: could not find field with name [${fieldRef}] referred to in a field-ref.@name attribute.</div>
                                <#else>
                                    <@formSingleSubField fieldNode/>
                                </#if>
                            <#elseif groupNode?node_name == "fields-not-referenced">
                                <#assign nonReferencedFieldList = sri.getFtlFormFieldLayoutNonReferencedFieldList(.node["@name"])>
                                <#list nonReferencedFieldList as nonReferencedField><@formSingleSubField nonReferencedField/></#list>
                            <#elseif groupNode?node_name == "field-row">
                                <div class="row"><#-- was field-row -->
                                <#assign inFieldRow = true>
                                <#list groupNode?children as rowChildNode>
                                    <#if rowChildNode?node_name == "field-ref">
                                        <div class="col-lg-6"><#-- was field-row-item -->
                                            <#assign fieldRef = rowChildNode["@name"]>
                                            <#assign fieldNode = "invalid">
                                            <#list formNode["field"] as fn><#if fn["@name"] == fieldRef><#assign fieldNode = fn><#break></#if></#list>
                                            <#if fieldNode == "invalid">
                                                <div>Error: could not find field with name [${fieldRef}] referred to in a field-ref.@name attribute.</div>
                                            <#else>
                                                <@formSingleSubField fieldNode/>
                                            </#if>
                                        </div><#-- /col-lg-6 not bigRow -->
                                    <#elseif rowChildNode?node_name == "fields-not-referenced">
                                        <#assign nonReferencedFieldList = sri.getFtlFormFieldLayoutNonReferencedFieldList(.node["@name"])>
                                        <#list nonReferencedFieldList as nonReferencedField><@formSingleSubField nonReferencedField/></#list>
                                    </#if>
                                </#list>
                                <#assign inFieldRow = false>
                                </div><#-- /row -->
                            </#if>
                        </#list>
                    </div><#-- /layoutNode -->
                </#if>
            </#list>
            <#if collapsibleOpened>
                </div><!-- /accordion id ${accordionId} -->
                <#assign afterFormScript>
                    $("#${accordionId}").accordion({ collapsible: true,<#if active?has_content> active: ${active},</#if> heightStyle: "content" });
                </#assign>
                <#t>${sri.appendToScriptWriter(afterFormScript)}
            </#if>
    <#else>
        <#list formNode["field"] as fieldNode><@formSingleSubField fieldNode/></#list>
    </#if>
        </fieldset>
    <#if !skipEnd></form></#if>
    <#if !skipStart>
        <#assign afterFormScript>
            $("#${formId}").validate({ errorClass: 'help-block', errorElement: 'span',
                highlight: function(element, errorClass, validClass) { $(element).parents('.form-group').removeClass('has-success').addClass('has-error'); },
                unhighlight: function(element, errorClass, validClass) { $(element).parents('.form-group').removeClass('has-error').addClass('has-success'); }
            });
            <#-- TODO init tooltips
            $(document).tooltip();
            -->

            <#-- if background-submit=true init ajaxForm; for examples see http://www.malsup.com/jquery/form/#ajaxForm -->
            <#if formNode["@background-submit"]! == "true">
            function backgroundSuccess${formId}(responseText, statusText, xhr, $form) {
                <#if formNode["@background-reload-id"]?has_content>
                    load${formNode["@background-reload-id"]}();
                </#if>
                <#if formNode["@background-message"]?has_content>
                <#-- TODO: do something much fancier than a dumb alert box -->
                    alert("${formNode["@background-message"]}");
                </#if>
                <#if formNode["@background-hide-id"]?has_content>
                    $('#${formNode["@background-hide-id"]}').modal('hide');
                </#if>
            }
            $("#${formId}").ajaxForm({ success: backgroundSuccess${formId}, resetForm: false });
            </#if>
        </#assign>
        <#t>${sri.appendToScriptWriter(afterFormScript)}
    </#if>
    <#if formNode["@focus-field"]?has_content>
        <#assign afterFormScript>
            $("#${formId}_${formNode["@focus-field"]}").focus();
        </#assign>
        <#t>${sri.appendToScriptWriter(afterFormScript)}
    </#if>
    <#t>${sri.popContext()}<#-- context was pushed for the form-single so pop here at the end -->
    <#if sri.doBoundaryComments()><!-- END   form-single[@name=${.node["@name"]}] --></#if>
</#macro>
<#macro formSingleSubField fieldNode>
    <#list fieldNode["conditional-field"] as fieldSubNode>
        <#if ec.resource.condition(fieldSubNode["@condition"], "")>
            <@formSingleWidget fieldSubNode/>
            <#return>
        </#if>
    </#list>
    <#if fieldNode["default-field"]?has_content>
        <@formSingleWidget fieldNode["default-field"][0]/>
        <#return>
    </#if>
</#macro>
<#macro formSingleWidget fieldSubNode>
    <#assign fieldSubParent = fieldSubNode?parent>
    <#if fieldSubNode["ignored"]?has_content && (fieldSubParent["@hide"]! != "false")><#return></#if>
    <#if fieldSubNode["hidden"]?has_content && (fieldSubParent["@hide"]! != "false")><#recurse fieldSubNode/><#return></#if>
    <#if fieldSubParent["@hide"]! == "true"><#return></#if>
    <#assign containerStyle = ec.resource.expand(fieldSubNode["@container-style"]!, "")>
    <#assign curFieldTitle><@fieldTitle fieldSubNode/></#assign>
    <#if bigRow>
        <div class="field-row-item">
            <div class="form-group">
                <#if curFieldTitle?has_content && !fieldSubNode["submit"]?has_content>
                    <label class="control-label" for="${formId}_${fieldSubParent["@name"]}">${curFieldTitle}</label><#-- was form-title -->
                </#if>
    <#else>
        <#if fieldSubNode["submit"]?has_content>
        <div class="form-group"><#-- was single-form-field -->
            <div class="<#if inFieldRow>col-lg-4<#else>col-lg-2</#if>"> </div>
            <div class="<#if inFieldRow>col-lg-8<#else>col-lg-10</#if><#if containerStyle?has_content> ${containerStyle}</#if>">
        <#elseif !(inFieldRow! && !curFieldTitle?has_content)>
        <div class="form-group"><#-- was single-form-field -->
            <label class="control-label <#if inFieldRow>col-lg-4<#else>col-lg-2</#if>" for="${formId}_${fieldSubParent["@name"]}">${curFieldTitle}</label><#-- was form-title -->
            <div class="<#if inFieldRow>col-lg-8<#else>col-lg-10</#if><#if containerStyle?has_content> ${containerStyle}</#if>">
        </#if>
    </#if>
    <#-- NOTE: this style is only good for 2 fields in a field-row! in field-row cols are double size because are inside a col-lg-6 element -->
    ${sri.pushContext()}
    <#list fieldSubNode?children as widgetNode><#if widgetNode?node_name == "set">${sri.setInContext(widgetNode)}</#if></#list>
    <#list fieldSubNode?children as widgetNode>
        <#if widgetNode?node_name == "link">
            <#assign linkNode = widgetNode>
            <#if linkNode["@condition"]?has_content><#assign conditionResult = ec.resource.condition(linkNode["@condition"], "")><#else><#assign conditionResult = true></#if>
            <#if conditionResult>
                <#if linkNode["@entity-name"]?has_content>
                    <#assign linkText = ""><#assign linkText = sri.getFieldEntityValue(linkNode)>
                <#else>
                    <#assign textMap = "">
                    <#if linkNode["@text-map"]?has_content><#assign textMap = ec.resource.expression(linkNode["@text-map"], "")!></#if>
                    <#if textMap?has_content>
                        <#assign linkText = ec.resource.expand(linkNode["@text"], "", textMap)>
                    <#else>
                        <#assign linkText = ec.resource.expand(linkNode["@text"]!"", "")>
                    </#if>
                </#if>
                <#if !linkNode["@encode"]?has_content || linkNode["@encode"] == "true"><#assign linkText = linkText?html></#if>
                <#assign linkUrlInfo = sri.makeUrlByType(linkNode["@url"], linkNode["@url-type"]!"transition", linkNode, linkNode["@expand-transition-url"]!"true")>
                <#assign linkFormId><@fieldId linkNode/></#assign>
                <#assign afterFormText><@linkFormForm linkNode linkFormId linkText linkUrlInfo/></#assign>
                <#t>${sri.appendToAfterScreenWriter(afterFormText)}
                <#t><@linkFormLink linkNode linkFormId linkText linkUrlInfo/>
            </#if>
        <#elseif widgetNode?node_name == "set"><#-- do nothing, handled above -->
        <#else><#t><#visit widgetNode>
        </#if>
    </#list>
    ${sri.popContext()}
    <#if bigRow>
        <#if curFieldTitle?has_content>
        </#if>
            </div><!-- /form-group -->
        </div><!-- /field-row-item -->
    <#else>
        <#if fieldSubNode["submit"]?has_content>
            </div><!-- /col -->
        </div><!-- /form-group -->
        <#elseif !(inFieldRow! && !curFieldTitle?has_content)>
            </div><!-- /col -->
        </div><!-- /form-group -->
        </#if>
    </#if>
</#macro>





















