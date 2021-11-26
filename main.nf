#!/usr/bin/env nextflow

cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'

process sayHello {
  echo true
  input:
    val x from cheers
  output:
    val x into receiver
  script:
    """
    echo '$x'
    """
}

process sayWorld {
  echo true
  input:
    val x from receiver
  script:
    """
    echo '$x received on step 2 and reply "world!"'
    """
}
