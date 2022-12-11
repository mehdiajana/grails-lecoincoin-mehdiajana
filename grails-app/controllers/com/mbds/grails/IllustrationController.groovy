package com.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.apache.commons.lang.RandomStringUtils

import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_ADMIN' , 'ROLE_CLIENT'])

class IllustrationController {

    IllustrationService illustrationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond illustrationService.list(params), model:[illustrationCount: illustrationService.count()]
    }

    def show(Long id) {
        respond illustrationService.get(id)
    }

    def create() {
        respond new Illustration(params)
    }

    def save(Illustration illustration) {
        if (illustration == null) {
            notFound()
            return
        }

        try {
            //illustrationService.save(illustration)


            illustrationService.save(illustration)


        } catch (ValidationException e) {
            respond illustration.errors, view:'create'
            return
        }


    }

    def edit(Long id) {
        respond illustrationService.get(id)
    }

    def update(Illustration illustration) {
        if (illustration == null) {
            notFound()
            return
        }
        try {
             illustrationService.save(illustration)

        }

         catch (ValidationException e) {
            respond illustration.errors, view:'edit'
            return
        }


    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        def illustration = Illustration.get(id)
        def annnonceid = illustration.annonce.id
        def filename = illustration.filename
        def file = new File(grailsApplication.config.illustrations.baseUrl + filename)
        file.delete()
        illustration.delete(flush: true)


        redirect controller:"annonce", id:annnonceid ,action:"edit", method:"GET"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message( default: 'Illustration'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
