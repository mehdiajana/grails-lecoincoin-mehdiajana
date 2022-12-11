<!DOCTYPE html>
<html>
    <head>
       <meta name="layout" content="main" />
         <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
<body>
<div class="nav" role="navigation">

</div>
<div id="show-annonce" class="content scaffold-show" role="main">
    <h1> Details de l'Annonce</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <section class="formshow">
        <input type="text" name="title" disabled="true" class="un" value=" ${this.annonce.title}" required="" maxlength="100" id="title">
        <input type="text" name="description" disabled="true"  class="un" value=" ${this.annonce.description}" required="" maxlength="100" id="description">
        <input type="text" name="price" disabled="true"  class="un" value=" ${this.annonce.price}" required="" maxlength="100" id="price">
        <input type="text" name="author" disabled="true"  class="un" value=" ${this.annonce.author}" required="" maxlength="100" id="author">

        <div class="fimage">
            <g:each var="listIllustrations" in="${annonce.illustrations}" >

                <img src=" ${grailsApplication.config.illustrations.baseUrl}${listIllustrations.filename}" height="150px" width="90px" />
            </g:each>
        </div>
    </section>


    <g:form resource="${this.annonce}" method="DELETE" >

            <g:link class="save1" style="margin-left: 550px" action="edit" resource="${this.annonce}"> Modifier</g:link>
            <input class="save1"    type="submit" value="Supprimer" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />



    </g:form>
</div>
</body>
</html>
