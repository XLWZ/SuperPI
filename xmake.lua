add_rules("mode.debug", "mode.release")

target("pi_css5")
    set_kind("binary")
    add_files("pi_fftcs.c", "fftsg_h.c")

    on_config(function (target)
        if target:toolchain("msvc") then
            target:add("cxflags", "/W4", "/fp:fast", {force = true})
        else
            target:add("cxflags", "-Wall", "-pedantic", "-O", "-fomit-frame-pointer", "-funroll-loops", "-malign-double", {force = true})
            target:add("ldflags", "-static", {force = true})
        end
    end)
