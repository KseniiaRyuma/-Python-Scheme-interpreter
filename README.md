# -Python-Scheme-interpreter
In this project, I developed an interpreter for a subset of the Scheme language. 
As you proceed, think about the issues that arise in the design of a programming language; 
many quirks of languages are byproducts of implementation decisions in interpreters and compilers.

I also implemented some small programs in Scheme. Scheme is a simple but powerful functional language. 

This project includes several files, but changes was only be made to the first four: 
scheme.py, scheme_reader.py, questions.scm, and tests.scm. 
Project contains the following files:

scheme.py: the Scheme evaluator
scheme_reader.py: the Scheme syntactic analyzer
questions.scm: a collection of functions written in Scheme
tests.scm: a collection of test cases written in Scheme
scheme_tokens.py: a tokenizer for Scheme
scheme_primitives.py primitive Scheme procedures
buffer.py: a buffer implementation

I developed the interpreter in several stages:

* Reading Scheme expressions
* Symbol evaluation
* Calling built-in procedures
* Definitions
* Lambda expressions and procedure definition
* Calling user-defined procedures
* Evaluation of special forms
