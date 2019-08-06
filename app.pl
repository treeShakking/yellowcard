sub gen_assets {
    my $app = shift;

    app->plugin(AssetPack => { pipes => [qw/Sass JavaScript Combine/]});

    app->asset->process(
                        'app.css' => qw{
                                         /sass/style.scss
                                     },
                       );

    app->asset->process(
        'app.js' => qw{
            /js/jquery-3.1.1.min.js
            /js/jquery-ui.min.js
            /js/jquery.tablesorter.js
            /js/main.js
        },
    );

    app->log->info('Copying assets...');
    my ($temp_css, $temp_js) = ((tempfile)[1], (tempfile)[1]);
    Mojo::File->new($temp_css)->spurt(
        join "\n", @{app->asset->processed('app.css')->map(sub {$_->content})}
    );
    Mojo::File->new($temp_js)->spurt(
        join "\n", @{app->asset->processed('app.js')->map(sub {$_->content})}
    );
    move $temp_css, 'html/css/app.css'
      or app->log->warn("Copying CSS failed: $!");

    mkdir "html/js" unless -d "html/js";
    move $temp_js,  'html/js/app.js'
        or app->log->warn("Copying JS failed: $!");
    app->log->info('...done');

}
