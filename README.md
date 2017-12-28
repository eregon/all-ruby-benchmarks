# All Ruby benchmarks

This is a set of Ruby benchmarks we used for TruffleRuby.

Nowadays they live in the [TruffleRuby repository](https://github.com/graalvm/truffleruby/tree/master/bench) for convenience.

They use [Benchmark-Interface](/benchmark-interface) as a harness.
The [`benchmark/ips`](https://github.com/evanphx/benchmark-ips) backend is
recommended:

```bash
$ gem install benchmark-ips
$ myruby benchmark-interface/bin/benchmark classic/mandelbrot.rb
```

There is also a simple backend just outputting iterations per second:

```bash
$ myruby benchmark-interface/bin/benchmark --simple classic/mandelbrot.rb
```

In most instances we have attempted to configure benchmarks to run at least an
iteration per second.

## Licences

See individual directories and files for licence information.
