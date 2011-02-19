dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}

hibernate {
//    show_sql = true
//    format_sql = true
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = "net.sf.ehcache.hibernate.EhCacheProvider"
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop"
            url = "jdbc:hsqldb:mem:devDB"
        }
    }
//uses MySQL 5.1 DS for test 
    test {
        dataSource {
            dbCreate = "update"  // one of 'create', 'create-drop','update'
	    url = "jdbc:mysql://localhost:3306/pollster_test?auto_reconnect=true"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
        }
    }

    production {
	dataSource {
            dbCreate = "update"  // one of 'create', 'create-drop','update'
	    url = "jdbc:mysql://localhost:3306/pollster_prod?auto_reconnect=true"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
        }
    }
}


