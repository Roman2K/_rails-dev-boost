# RailsDevelopmentBoost

Alternative to Josh Goebel's [`rails_dev_mode_performance`](https://github.com/yyyc514/rails_dev_mode_performance) plugin.

## Background

Why create a similar plugin? Because I couldn't get Josh Goebel's to work in my projects. His attempts to keep templates cached in a way that fails with recent versions of Rails. Also, removing the faulty chunk of code revealed another issue: it stats source files that may not exist, without trying to find their real path beforehand. That would be fixable is the code wasn't such a mess (no offense).

I needed better performance in development mode right away, so here is an alternative implementation.

## Usage

    script/plugin install <repo>

When the server is started in *development* mode, the special unloading mechanism takes over.

It can also be used in combination with RailsTestServing for even faster test runs by forcefully enabling it in test mode. To do so, add the following in `config/environments/test.rb`:

    def config.soft_reload() true end if RailsTestServing.active?
