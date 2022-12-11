<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
<style>

</style>
    <body>

        <div id="list-illustration" class="content scaffold-list" role="main">
            <H1>La liste des Illustrations</H1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="table" id="tablei" style="margin-left: 100px">
                <thead class="thead-dark">
                <tr >
                    <g:sortableColumn property="Filename" title="Filename" style="text-align:center !important;"/>
                    <g:sortableColumn property="Annonce" title="Annonce" />
                    <g:sortableColumn property="Modifier et visualiser" title="Modifier et visualiser" style="text-align:center !important;"/>

                </tr>
                </thead>
                <tbody>
                <g:each var="Illustration" in="${illustrationList}" >
                    <tr>
                        <td> ${Illustration.filename}</td>
                        <td>  ${Illustration.annonce}</td>
                    <td>
                    <g:form resource="${this.illustration}"   method="DELETE">

                        <g:link   class="" action="edit" resource="${this.Illustration}" id="${Illustration.id}">   <img src="https://www.seekpng.com/png/detail/202-2022672_edit-comments-edit-icon-png-circle.png" style="width: 45px; height: 45px; margin-top: 10px"/></g:link>
                        <g:link   class="" action="show" resource="${this.Illustration}" id="${Illustration.id}">   <img src="https://img.favpng.com/9/10/17/eye-computer-icons-logo-png-favpng-kyth1iHUKQQfat12HnjU4nW1J.jpg" style="width: 90px; height: 45px; margin-top: 10px"/> </g:link> <br><br>
                        <br>


                    </g:form>  </td>
                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${illustrationCount ?: 0}" />
            </div>
        </div>
    </body>
</html>