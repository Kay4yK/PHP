<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit6004d86adf422b648fdb0ec91db7be2d
{
    public static $prefixLengthsPsr4 = array (
        'W' => 
        array (
            'WebsysForever\\' => 14,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'WebsysForever\\' => 
        array (
            0 => __DIR__ . '/..' . '/websys-forever/gettextimg/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit6004d86adf422b648fdb0ec91db7be2d::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit6004d86adf422b648fdb0ec91db7be2d::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
