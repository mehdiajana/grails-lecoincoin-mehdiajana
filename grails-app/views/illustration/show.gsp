<%@ page import="com.mbds.grails.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message( default: 'Illustration')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="show-illustration" class="content scaffold-show" role="main">

            <h1> Details de l'illustration</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
<div class="un" style="height: 150px; margin-left: 190px" >
    <img src="${grailsApplication.config.illustrations.baseUrl+illustration.filename}" style="margin-top: 49px ; height: 60px ; " />
</div>


           <g:link controller="annonce" class="un"  style=" margin-left: 600px" action="show" id="${illustration.id}">Lien vers l'annonce</g:link><br><br>
            <select class="un"  style="margin-left: 200px" >
            <g:each in="${User.list()}" var="user">
                <option>
                    ${user.username}
                </option>

            </g:each>
        </select>
            <g:form resource="${this.illustration}" method="DELETE">

                    <g:link class="save1" style="margin-left: 610px" action="edit" resource="${this.illustration}" ><g:message code="default.button.edit.label" default="Edit"  /></g:link>
                    <input class="save1" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

            </g:form>
        </div>
    </body>
</html>
