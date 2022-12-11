package com.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.apache.commons.lang.RandomStringUtils
import  java.io.File;

@Secured(['ROLE_ADMIN' , 'ROLE_CLIENT'])
class AnnonceController {

    AnnonceService annonceService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond annonceService.list(params), model:[annonceCount: annonceService.count()]
    }

    def show(Long id) {
        respond annonceService.get(id)
    }

    def create() {

        respond new Annonce(params), model: [userList: User.list()]
    }


    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }
        try {

            def user = User.get(params.author)

            request.multipartFiles.eachWithIndex {
                def mfile, int index ->
                    def filetest = request.getFile('filename'+index)

                    String charset = (('A'..'Z') + ('0'..'9')).join()
                    Integer length = 9
                    String randomString = RandomStringUtils.random(length, charset.toCharArray())
                   // String path = servletContext.getResource("/").getPath();
                  //  String tempPath = System.getProperty("java.io.assets")
                    def file = new File(grailsApplication.config.illustrations.basePath+randomString+".jpg")
                    filetest.transferTo(file)


                    annonce.addToIllustrations(new Illustration(filename: file.getName()))
            }
            annonceService.save(annonce)
            user.addToAnnonces(annonces: annonce)
            user.save(flush: true, failOnError: true)
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message( default: 'Annonces'), annonces.id])
                    redirect annonce
                }
                '*' { respond annonce, [status: CREATED] }
            }

        } catch (ValidationException e) {
            respond annonce.errors, view: 'create'
            return

        }









        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message( default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond annonceService.get(id)
    }

    def update(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }
        try {
            request.multipartFiles.eachWithIndex {
                def mfile, int index ->
                    def f = request.getFile('filename'+index)
                    String charset = (('A'..'Z') + ('0'..'9')).join()
                    Integer length = 9
                    String randomString = RandomStringUtils.random(length, charset.toCharArray())
                    def file = new File(grailsApplication.config.illustrations.basePath+randomString+".jpg")
                    f.transferTo(file)

                    annonce.addToIllustrations(new Illustration(filename: file.getName()))
            }
            annonce.title = params.title
            annonce.description = params.description
            annonce.price = Float.parseFloat(params.price)
             annonce.illustrations=params.filename
            annonceService.save(annonce)

        }

        catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message( default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message( default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message( default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
