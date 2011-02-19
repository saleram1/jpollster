class UrlMappings {
    static mappings = {
      "/dashboard/$id?"(controller:"dash", action:"show")
      "/ideaboard/$id?"(controller:"dash", action:"show_idea")

      "/admin/$id?"(controller:"campaign", action:"list")

      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      "/"(view:"/index")
	  "500"(view:'/error')
	}
}
