geditclone_sources = [
  'application.vala',
  'window.vala',
]

geditclone_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]

gnome = import('gnome')

geditclone_sources += gnome.compile_resources('geditclone-resources',
  'geditclone.gresource.xml',
  c_name: 'geditclone'
)

executable('geditclone', geditclone_sources,
  vala_args: '--target-glib=2.50',  dependencies: geditclone_deps,
  install: true,
)
