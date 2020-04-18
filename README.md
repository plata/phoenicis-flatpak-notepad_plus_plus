# phoenicis-flatpak-notepadplusplus
Proof of concept for Phoenicis app flatpaks

### Build
```
git clone https://github.com/plata/phoenicis.git
cd phoenicis
git checkout flatpak-app-integration
mvn package
cd ..
git clone https://github.com/plata/phoenicis-flatpak-notepad_plus_plus.git
cp phoenicis/phoenicis-dist/target/phoenicis-flatpak.zip phoenicis-flatpak-notepad_plus_plus
cd phoenicis-flatpak-notepad_plus_plus
flatpak-builder build-dir org.phoenicis.notepad_plus_plus.yml --force-clean --user --install
```

### Run
```
flatpak run org.phoenicis.notepad_plus_plus run-app
```

### How it works
- If the app is not installed (i.e. normally for the first run), perform an installation with Phoenicis. This also installs the required Wine version.
- Otherwise run the app.
