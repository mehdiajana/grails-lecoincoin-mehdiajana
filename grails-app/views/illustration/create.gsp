<!DOCTYPE html>
<html>
    <head>

        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'illustration.label', default: 'Illustration')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="create-illustration" class="content scaffold-create" role="main">
            <H1>Ajouter une Illustration</H1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.illustration}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.illustration}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.illustration}" method="POST">
                <fieldset class="formu">

                    <div class="fieldcontain required">
                        <br><br><br>
                        <g:select style="border: 2px solid black;
                            border-radius: 5px;" class="un" from="${com.mbds.grails.Annonce.list()}"
                                  name="annonce.id" id='annonce.id' optionKey="id" optionValue="title"/>
                        <input style="border: 2px solid black;
                    border-radius: 5px;" type="file"  class ="un" name="filename" value="" required="" id="fileInput" placeholder="Entrez un nom de fichier">
                        <g:submitButton style="border: 2px solid black;
                            border-radius: 5px;" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

                    </div>
                   </fieldset>




            </g:form>
        </div>
    </body>
</html>
