
-- add modes: debug and release 
add_rules("mode.debug", "mode.release")

-- add include directories
add_includedirs(".")

-- add target
target("nonpnp")

    -- add rules
    add_rules("wdk.kmdf.driver", "wdk.sign.test")

    -- add flags for rule: wdk.tracewpp
    add_values("wdk.tracewpp.flags", "-func:TraceEvents(LEVEL,FLAGS,MSG,...)", "-func:Hexdump((LEVEL,FLAGS,MSG,...))")

    -- add files
    add_files("driver/*.c", {rule = "wdk.tracewpp"}) 
    add_files("driver/*.rc")

-- add target
target("app")

    -- add rules
    add_rules("wdk.kmdf.binary")

    -- add files
    add_files("exe/*.c") 
    add_files("exe/*.inf")

