<!DOCTYPE html>
<html>
    <head>
              <meta name="layout" content="main" />
        <g:set var="entityName" value="${message( default: 'Annonce')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">

        </div>
        <div id="edit-annonce" class="content scaffold-edit" role="main">
            <H1>Modifier une Annonce</H1>
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
            <g:form resource="${this.annonce}" method="PUT">
                <g:hiddenField name="version" value="${this.annonce?.version}" />

                <fieldset class="form">
                    <div class="fieldcontain required">
                       <input style="border: 2px solid black;
                       border-radius: 5px;" type="text" name="title"  class="un" value=" ${this.annonce.title}" required="" maxlength="100" id="title">
                    </div><div class="fieldcontain required">
                    <input style="border: 2px solid black;
                    border-radius: 5px;" type="text" name="description" class="un"  value=" ${this.annonce.description}"required="" id="description">
                </div><div class="fieldcontain required">
                    <input style="border: 2px solid black;
                    border-radius: 5px;"  name="price" class="un"  type="number integer"   min="0" step="1" value=" ${this.annonce.price}"   required=""  id="price">
                 </div><div class="fieldcontain">

                </div> <div class="fieldcontain required">
                      <div class="form-group">
                        <g:select style="border: 2px solid black;
                            border-radius: 5px;" class="un" from="${com.mbds.grails.User.list()}"
                                  name="author" id='author' optionKey="id" optionValue="username"/> </div>
                </div>
                    <g:link style="border: 2px solid black;
                            border-radius: 5px;" class="un" controller="illustration" action="create"
                            id="${annonce.id}">Ajouter une illustration
                    </g:link> <br><br>
                    <div class="form-label-group">



                        <div class="form-label-group">
                            <input style="border: 2px solid black;
                            border-radius: 5px;" class="save" type="submit"
                                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>

                        </div>
                    </div>
                </fieldset>
            </g:form>

        </div>

    </body>
<script>

</script>

</html>
