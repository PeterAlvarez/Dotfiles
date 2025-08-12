
# commands.py — versión corregida para Ranger
# Soporta: comprimir (zip, tar, tar.gz, rar, 7z) y descomprimir automáticamente

from __future__ import (absolute_import, division, print_function)
import os
import shlex
from ranger.api.commands import Command


class my_edit(Command):
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """

    def execute(self):
        if self.arg(1):
            target_filename = self.rest(1)
        else:
            target_filename = self.fm.thisfile.path

        self.fm.notify("Let's edit the file " + target_filename + "!")

        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        self.fm.edit_file(target_filename)

    def tab(self, tabnum):
        return self._tab_directory_content()


class compress(Command):
    """:compress <nombre_archivo>

    Comprime los archivos seleccionados.

    Uso:
      - Selecciona archivos/directorios con <Space>
      - Ejecuta: :compress backup.zip  (o backup.tar.gz / backup.tar / backup.rar / backup.7z)
    """

    def execute(self):
        nombre = self.rest(1)
        if not nombre:
            self.fm.notify("Debes indicar el nombre del archivo (ej: backup.zip)", bad=True)
            return

        seleccion = [f.path for f in self.fm.thistab.get_selection()]
        if not seleccion:
            self.fm.notify("No hay archivos seleccionados.", bad=True)
            return

        archivos_citados = " ".join(shlex.quote(p) for p in seleccion)
        salida = shlex.quote(nombre)

        if nombre.endswith('.zip'):
            cmd = f"zip -r {salida} {archivos_citados}"
        elif nombre.endswith('.tar.gz') or nombre.endswith('.tgz'):
            cmd = f"tar -czvf {salida} {archivos_citados}"
        elif nombre.endswith('.tar'):
            cmd = f"tar -cvf {salida} {archivos_citados}"
        elif nombre.endswith('.rar'):
            cmd = f"rar a {salida} {archivos_citados}"
        elif nombre.endswith('.7z'):
            cmd = f"7z a {salida} {archivos_citados}"
        else:
            self.fm.notify("Formato no soportado. Usa: .zip, .tar, .tar.gz/.tgz, .tar, .rar, .7z", bad=True)
            return

        self.fm.notify(f"Creando: {nombre}")
        self.fm.run(cmd)
        # recarga la vista del directorio para que aparezca el archivo creado
        try:
            self.fm.thisdir.load_content()
        except Exception:
            pass

    def tab(self, tabnum):
        return ["archivo.zip", "archivo.tar.gz", "archivo.tar", "archivo.rar", "archivo.7z"]


class extract(Command):
    """:extract
    Descomprime los archivos seleccionados en el directorio actual (sin rutas absolutas).
    """
    def execute(self):
        import shlex
        seleccion = [f.path for f in self.fm.thistab.get_selection()]
        if not seleccion:
            self.fm.notify("No hay archivos seleccionados.", bad=True)
            return

        for p in seleccion:
            pq = shlex.quote(p)
            if p.endswith('.zip'):
                cmd = f"unzip -j {pq}"
            elif p.endswith('.tar.gz') or p.endswith('.tgz'):
                cmd = f"tar --strip-components=1 -xzvf {pq}"
            elif p.endswith('.tar'):
                cmd = f"tar --strip-components=1 -xvf {pq}"
            elif p.endswith('.rar'):
                cmd = f"unrar e {pq}"
            elif p.endswith('.7z'):
                cmd = f"7z x -aoa -o. {pq}"
            else:
                self.fm.notify(f"Ignorado (formato no soportado): {p}", bad=True)
                continue

            self.fm.notify(f"Ejecutando: {cmd}")
            self.fm.run(cmd)

        try:
            self.fm.thisdir.load_content()
        except Exception:
            pass
    
from ranger.api.commands import Command
import shlex

class open_thunar(Command):
    """:open_thunar
    Abre Thunar en el directorio actual de Ranger.
    """
    def execute(self):
        path = self.fm.thisdir.path
        self.fm.run(f"thunar {shlex.quote(path)} &", flags='f')


class copy_name(Command):
    """:copy_name
    Copia el nombre del archivo o directorio actual al portapapeles.
    """
    def execute(self):
        import subprocess
        name = self.fm.thisfile.relative_path
        subprocess.run(f"echo -n {shlex.quote(name)} | xclip -selection clipboard", shell=True)
        self.fm.notify(f"Nombre copiado: {name}")

from ranger.api.commands import Command
import shlex

class recent_files(Command):
    """:recent_files
    Lista los archivos en el directorio actual, ordenados por fecha (recientes primero).
    """
    def execute(self):
        path = self.fm.thisdir.path
        self.fm.run(f"ls -lt {shlex.quote(path)} | less", flags='p')
