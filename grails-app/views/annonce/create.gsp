<!DOCTYPE html>
<html>
    <head>
           <meta name="layout" content="main" />
        <g:set var="entityName" value="${message( default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

    </head>
    <body>


        <div id="create-annonce" class="content scaffold-create" role="main">
            <H1>Ajouter une Annonce</H1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <g:uploadForm resource="${this.annonce}" method="POST" >



                <fieldset class="form">
<br>
                        <div class="fieldcontain required">
                            <input style="border: 2px solid black;
                            border-radius: 5px;" type="text" name="title" class="un" value="" required="" maxlength="100" id="title" placeholder="le Titre">
                        </div><div class="fieldcontain required">
                         <input style="border: 2px solid black;
                         border-radius: 5px;" type="text" name="description"  class="un"  value="" required="" id="description" placeholder="la Description">
                    </div><div class="fieldcontain required">

                            <input style="border: 2px solid black;
                            border-radius: 5px;" type="number decimal" name="price" class="un" value="" required="" step="0.01" min="0.0" id="price" placeholder="le Prix">

                    <input style="border: 2px solid black;
                    border-radius: 5px;" class="un" type="file" name="filename0" value="" required="" id="fileInput"
                           placeholder="Image">



                    <div class="form-group">
                        <g:select style="border: 2px solid black;
                            border-radius: 5px;" class="un" from="${com.mbds.grails.User.list()}"
                                  name="author" id='author' optionKey="id" optionValue="username"/> </div>
                    </div>

                    <g:submitButton  style="border: 2px solid black;
                            border-radius: 5px;" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

                </fieldset>




            </g:uploadForm>
        </div>
    </body>



</html>
