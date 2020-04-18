#!/bin/bash

#
# constants
#
phoenicis_dir=~/.Phoenicis/
shortcuts_dir="$phoenicis_dir/shortcuts/"

name="Notepad++"
shortcut="$shortcuts_dir/Notepad.shortcut"
install_id="applications development notepad_plus_plus online"

# check if app has been installed already
if [ -f "$shortcut" ]; then
    # do not use Wine runtime (e.g. Notepad++ crashes otherwise)
    # TODO: use phoenicis-shortcut-runner.sh
    /app/jre/bin/java -Dapplication.environment.wineRuntime=false --add-modules=jdk.crypto.ec,java.base,javafx.base,javafx.web,javafx.media,javafx.graphics,javafx.controls,java.naming,java.sql,java.scripting,jdk.internal.vm.ci,jdk.internal.vm.compiler,org.graalvm.truffle,jdk.jsobject,jdk.xml.dom --module-path /app/phoenicis/lib/ -XX:+UnlockExperimentalVMOptions -XX:+EnableJVMCI -cp "/app/phoenicis/lib/*" --upgrade-module-path=/app/phoenicis/lib/compiler.jar org.phoenicis.cli.PhoenicisCLI -run "$name"
else
    # do not use Wine runtime (e.g. Notepad++ crashes otherwise)
    # TODO: use graphical installer instead of CLI
    /app/jre/bin/java -Dapplication.environment.wineRuntime=false --add-modules=jdk.crypto.ec,java.base,javafx.base,javafx.web,javafx.media,javafx.graphics,javafx.controls,java.naming,java.sql,java.scripting,jdk.internal.vm.ci,jdk.internal.vm.compiler,org.graalvm.truffle,jdk.jsobject,jdk.xml.dom --module-path /app/phoenicis/lib/ -XX:+UnlockExperimentalVMOptions -XX:+EnableJVMCI -cp "/app/phoenicis/lib/*" --upgrade-module-path=/app/phoenicis/lib/compiler.jar org.phoenicis.cli.PhoenicisCLI -install $install_id
fi
