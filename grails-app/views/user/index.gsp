<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />

        <asset:stylesheet src="application.css "/>
</head>

<body>

<div id="list-user" class="content scaffold-list" role="main">
    <H1>La liste des Utilisateurs</H1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table class="t1">
        <thead class="thead-dark">
        <tr >
            <g:sortableColumn property="Nom de utilisateur" title="Nom de utilisateur" tyle="text-align:center !important;"/>
            <g:sortableColumn property="compte expiré " title="compte expiré " style="text-align:center !important;"/>
            <g:sortableColumn property="compte verrouillé" title="compte verrouillé" style="text-align:center !important;"/>
            <g:sortableColumn property="Annonce" title="Annonce" style="text-align:center !important;"/>


         </tr>
        </thead>
        <tbody>
        <g:each var="user" in="${userList}" >
            <tr>
                <td><g:link controller="user" action="show" id="${user.id}">${user.username}</g:link></td>
                <td style="text-align:center !important;">${user.accountExpired}</td>
                <td style="text-align:center !important;">${user.accountLocked}</td>
<td> <select class="un" >
    <g:each var="listannonce" in="${user.annonces}" >

        <option>
            ANNONCE : ${listannonce.id}
        </option>

    </g:each> </select></td>

            </tr>
        </g:each>
        </tbody>
    </table>




</div>
</body>
</html>