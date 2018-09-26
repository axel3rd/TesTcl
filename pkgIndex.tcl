# Tcl package index file, version 1.1
# This file is generated by the "pkg_mkIndex" command
# and sourced either when an application starts up or
# by a "package unknown" script.  It invokes the
# "package ifneeded" command to set up package-related
# information so that packages will be loaded automatically
# in response to "package require" commands.  When this
# script is sourced, the variable $dir must contain the
# full path name of this file's directory.

if  {[namespace exists ::testcl]} {
  #already loaded
  return
} 

set disable_interpreter_warning [ expr { [ array names env DISABLE_TESTCL_INTERPRETER_WARNING ] ne "" && $env(DISABLE_TESTCL_INTERPRETER_WARNING) eq "true"} ]

if { $::tcl_platform(platform) eq "java" } {

  if { [catch { expr {"abc" starts_with "a"} } errormsg ] } {
    puts stderr "WARNING"
    puts stderr "WARNING The jtcl-irule extension to JTcl is not loaded"
    puts stderr "WARNING"
    puts stderr "WARNING The following custom iRule operators will not work:"
    puts stderr "WARNING   - starts_with" 
    puts stderr "WARNING   - ends_with" 
    puts stderr "WARNING   - contains" 
    puts stderr "WARNING   - matches_glob" 
    puts stderr "WARNING   - matches_regex" 
    puts stderr "WARNING   - equals" 
    puts stderr "WARNING   - and" 
    puts stderr "WARNING   - or" 
    puts stderr "WARNING   - not"
    puts stderr "WARNING"
    puts stderr "WARNING Please check your JTcl classpath - see TesTcl documentation"
    puts stderr "WARNING for installation instructions"
    puts stderr "WARNING"		  
  }
		
} elseif { ! $disable_interpreter_warning } {

  puts stderr "WARNING"
  puts stderr "WARNING You're using a Tcl interpreter that doesn't support the jtcl-irule extension"
  puts stderr "WARNING which requires the java based JTcl interpreter"
  puts stderr "WARNING"
  puts stderr "WARNING The following custom iRule operators will not work:"
  puts stderr "WARNING   - starts_with" 
  puts stderr "WARNING   - ends_with" 
  puts stderr "WARNING   - contains" 
  puts stderr "WARNING   - matches_glob" 
  puts stderr "WARNING   - matches_regex" 
  puts stderr "WARNING   - equals" 
  puts stderr "WARNING   - and" 
  puts stderr "WARNING   - or" 
  puts stderr "WARNING   - not"
  puts stderr "WARNING"
  puts stderr "WARNING If you require any of these operators, you'll have to use JTcl instead"
  puts stderr "WARNING Please see TesTcl documentation"
  puts stderr "WARNING"
}

set files { assert.tcl it.tcl on.tcl onirule.tcl irulehttp.tcl iruleuri.tcl global.tcl ip.tcl classes.tcl }
set sources {}
foreach {f} $files {
    lappend sources [list source [file join $dir src $f]]
}
package ifneeded testcl 1.0.12 [join $sources "\n"]

# Disable certain Tcl commands from iRules
if { $::tcl_platform(platform) eq "java" } {
  source [file join $dir src/disabled_commands_jtcl.tcl]
} else {
  source [file join $dir src/disabled_commands_tclsh.tcl]
}
