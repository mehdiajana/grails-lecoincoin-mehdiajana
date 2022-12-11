package mbds_grails_22_23

import com.mbds.grails.Annonce
import com.mbds.grails.Illustration
import com.mbds.grails.Role
import com.mbds.grails.User
import com.mbds.grails.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminUserInstance = new User(username: "admin",password: "admin").save()
        def adminRole = new Role(authority: "ROLE_ADMIN").save()
        UserRole.create(adminUserInstance, adminRole, true)
//ajouter un role client
        def Userin = new User(username: "user",password: "user").save()


        def userole1 = new Role(authority: "ROLE_CLIENT").save()

        UserRole.create(Userin,userole1, true)

        def  administer= new User (username: "admin1",password:"pass" ).save()
        UserRole.create(administer, adminRole,true)


    }
    def destroy = {

    }
}
