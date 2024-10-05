ngspice-prebuilt
================
Prebuilt of [ngspice download | SourceForge.net](https://sourceforge.net/projects/ngspice/)

```bash
mkdir ngspice-32-build
pushd ngspice-32-build

/.../ngspice-32/configure \
  --prefix=/usr/local \
--enable-xspice \
  --disable-debug \
  --enable-cider \
  --with-readline=yes \
  --enable-openmp \
  --with-ngshared

 make # -j4
 make install
```
### Notes
- Git in SourceForge in updated, in GitHub is outdated

### Playground
- [dirkarnez/ngspice-playground](https://github.com/dirkarnez/ngspice-playground)
