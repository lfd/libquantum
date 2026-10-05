project('libquantum', 'c',
  default_options: [
    'buildtype=debugoptimized',
  ]
)

cc = meson.get_compiler('c')

# Enable OpenMP
openmp_dep = dependency('openmp', required: true)
inc = include_directories('include')

# List of core source files for the library
lib_sources = files(
'src/classic.c', 'src/qcomplex.c', 'src/decoherence.c', 'src/density.c',
'src/energy.c', 'src/error.c', 'src/expn.c', 'src/gates.c', 'src/lapack.c',
'src/matrix.c', 'src/measure.c', 'src/objcode.c', 'src/oaddn.c',
'src/omuln.c', 'src/qec.c', 'src/qft.c', 'src/qtime.c','src/qureg.c', 'src/version.c'
)

libquantum = both_libraries('quantum', lib_sources,
  include_directories: inc,
  dependencies: [openmp_dep],
  link_args: ['-lm', '-fPIC', '-DPIC', '-llapack'],
  install: true,
  soversion: '8',
  install_dir: 'lib'
)

# Install headers; also stage the public header in the build directory, so
# in-tree consumers take everything from there.
install_headers('include/quantum.h')
configure_file(input: 'include/quantum.h', output: 'quantum.h', copy: true)
