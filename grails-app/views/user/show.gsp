<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />

    </head>
<body>
<div class="nav" role="navigation">

</div>
<div id="show-annonce" class="content scaffold-show" role="main">
    <H1>Details de 'Utilisateur</H1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <section class="formshow">
        <input type="text" name="title" disabled="true" class="un" value="Username : ${this.user.username}" required="" maxlength="100" id="title">
        <select class="un" >
        <g:each var="listannonce" in="${user.annonces}" >

           <option>
ANNONCE : ${listannonce.title}
           </option>

        </g:each> </select>
        <input type="text" name="price" disabled="true"  class="un" value=" compte enable : ${this.user.enabled}" required="" maxlength="100" id="price">
        <input type="text" name="author" disabled="true"  class="un" value=" compte verrouillé :${this.user.accountLocked}" required="" maxlength="100" id="author">
        <input type="text" name="author" disabled="true"  class="un" value=" compte expiré :${this.user.accountExpired}" required="" maxlength="100" id="autho1">




    </section>


    <g:form resource="${this.user}" method="DELETE" >

        <g:link class="save1" style="margin-left: 550px" action="edit" resource="${this.user}"> Modifier</g:link>
        <input class="save1"    type="submit" value="Supprimer" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />



    </g:form>
</div>
</body>
</html>
