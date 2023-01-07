# (Puppet file for installing all required packages for ReConnect web app)
package {'flask':
    ensure   => '2.1.0',
    provider => 'pip3',
}
package {'Flask_Cors':
    ensure => '3.0.10',
}
package {'mtcnn':
    ensure => '0.1.1',
}
package {'numpy':
    ensure => '1.17.4',
}
package {'opencv_python':
    ensure => '4.7.0.68',
}
package {'scipy':
    ensure => '1.3.3',
}
package {'tensorflow':
    ensure   => '2.11.0',
    provider => 'pip',
}
package {'keras_facenet':
    ensure   => '0.3.2',
    provider => 'pip',
}
package {'numpy':
    ensure  => '1.17.4',
}
package {'SQLAlchemy':
    ensure  => '1.4.41',
}
package {'Werkzeug':
    ensure  => '2.2.2',
}
