<!DOCTYPE html>
<html>
    <head>
      <meta name="layout" content="main" />
         <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
      <body>

        <div id="list-annonce" class="content scaffold-list" role="main">
            <h1>Liste des annonces</h1>
            <g:if test="${flash.message}" style="text-align: center">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="table" >
                <thead class="thead-dark">
                <tr > <g:sortableColumn property="illustrations" title="Illustrations" />
                    <g:sortableColumn property="title" title="Titre" style="text-align:center !important;"/>


                    <g:sortableColumn property="price" title="Prix" style="text-align:center !important;"/>

                    <g:sortableColumn property="Modifier et visualiser" title="Modifier et visualiser" style="text-align:center !important;"/>
                </tr>
                </thead>
                <tbody>
                <g:each var="annonce" in="${annonceList}" >
                    <tr>  <td style="text-align: center !important;">
                        <g:each var="listIllustrations" in="${annonce.illustrations}" >

                            <img src=" ${grailsApplication.config.illustrations.basePath}${listIllustrations.filename}" style="margin-top: 10px" height="90px" width="90px" />
                        </g:each>
                    </td>
                        <td><g:link controller="annonce" action="show" id="${annonce.id}">${annonce.title}</g:link></td>



                        <td style="text-align:center !important;">${annonce.price}</td>

                        <td style="text-align: center !important;">

                            <g:form resource="${this.annonce}"   method="DELETE">

                                    <g:link   class="" action="edit" resource="${this.annonce}" id="${annonce.id}">  <img src="https://www.seekpng.com/png/detail/202-2022672_edit-comments-edit-icon-png-circle.png" style="width: 45px; height: 45px; margin-top: 10px"/></g:link>
                                    <g:link   class="" action="show" resource="${this.annonce}" id="${annonce.id}">   <img src="https://img.favpng.com/9/10/17/eye-computer-icons-logo-png-favpng-kyth1iHUKQQfat12HnjU4nW1J.jpg" style="width: 90px; height: 45px; margin-top: 10px"/> </g:link> <br><br>
                                <br>


                            </g:form>  </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>