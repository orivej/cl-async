(asdf:defsystem cl-async-base
  :author "Andrew Danger Lyon <orthecreedence@gmail.com>"
  :license "MIT"
  :version "0.6.0"
  :description "Base system for cl-async."
  :depends-on (#:cffi #:cl-libuv #:bordeaux-threads)
  :components
  ((:file "base")))

(asdf:defsystem cl-async-util
  :author "Andrew Danger Lyon <orthecreedence@gmail.com>"
  :license "MIT"
  :version "0.6.0"
  :description "Internal utilities for cl-async."
  :depends-on (#:cffi
               #:fast-io
               #:cl-libuv
               #:cl-ppcre
               #:cl-async-base)
  :components
  ((:file "util")))

(asdf:defsystem cl-async
  :author "Andrew Danger Lyon <orthecreedence@gmail.com>"
  :license "MIT"
  :version "0.6.0"
  :description "Asynchronous operations for Common Lisp."
  :depends-on (#:cffi
               #:trivial-features
               #:static-vectors
               #:cl-libuv
               #:cl-async-base
               #:cl-async-util
               #:babel
               #:cl-ppcre
               #:trivial-gray-streams
               #:uiop)
  :components
  ((:file "package")
   (:file "event-loop" :depends-on ("package"))
   (:file "event" :depends-on ("package"))
   (:file "dns" :depends-on ("package"))
   (:file "streamish" :depends-on ("event-loop" "event"))
   (:file "async-stream" :depends-on ("streamish"))
   (:file "socket" :depends-on ("streamish" "async-stream"))
   (:file "tcp" :depends-on ("dns" "socket"))
   (:file "filesystem" :depends-on ("streamish"))
   (:file "pipe" :depends-on ("socket" "filesystem"))
   (:file "signal" :depends-on ("streamish"))
   (:file "notify" :depends-on ("streamish"))
   (:file "poll" :depends-on ("streamish"))
   (:file "idle" :depends-on ("package"))
   (:file "process" :depends-on ("pipe"))))
