jsf {
  /*provided = false //Useful for jsf compliant containers.
  version = 1 //Can be JSF2*/
  params{
    com.icesoft.faces.compressDOM = false
    com.icesoft.faces.compressResources = false
    //facelets.LIBRARIES = /WEB-INF/tld/custom.taglib.xml
    //com.icesoft.faces.uploadDirectory = /WEB-INF/upload
    com.icesoft.faces.synchronousUpdate = false
    com.icesoft.faces.concurrentDOMViews = true
  }
}
icefaces {
  extension = "iface" // iface|jsf|faces|jsp|jspx|html|xhtml|seam
  dev.push = true
  context.push = true
}