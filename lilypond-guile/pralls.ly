% Usage:
% \fixed c' { \hprall c4 c} -- notice that you have to input the
% notes in twice. This is because the function only outputs the appoggiatura based off the inputted note
% This is done deliberately, so the appoggiaturas play nice with the beaming +
% it makes it more flexible to do more complex/unusual ornaments
%
% You may have to manually force the beaming if you want the ornaments to be nested inside the beams:
%     \fixed c' {\time 2/4 
%     \hprall c16 c [d \hmord e e f] g4 |
%      }


%% half step prall triller
hprall = #(define-music-function (note) (ly:music?)
(let* ((copy-note (ly:music-deep-copy note))
       (pitch (ly:music-property copy-note 'pitch))
       (copy-note2 (ly:music-deep-copy note))
       (notename (ly:pitch-steps pitch))
       (duration (ly:music-property copy-note 'duration))
       (octave (ly:pitch-octave (ly:music-property note 'pitch))))
  (cond 
    ((equal? (ly:pitch-alteration pitch) 0)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 (+ 1 notename) -1/2)))
    ((equal? (ly:pitch-alteration pitch) -1/2)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 notename 0)))
    ((equal? (ly:pitch-alteration pitch) 1/2)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 (+ 1 notename) 0))))

  (set! (ly:music-property copy-note 'duration) (ly:make-duration 4))
  (set! (ly:music-property copy-note2 'duration) (ly:make-duration 4))
  #{
  \appoggiatura{ $copy-note2 $copy-note } 
  #}))

%% minor third prall triller
mtprall = #(define-music-function (note) (ly:music?)
(let* ((copy-note (ly:music-deep-copy note))
       (pitch (ly:music-property copy-note 'pitch))
       (copy-note2 (ly:music-deep-copy note))
       (notename (ly:pitch-steps pitch))
       (duration (ly:music-property copy-note 'duration))
       (octave (ly:pitch-octave (ly:music-property note 'pitch))))
  (cond 
    ((equal? (ly:pitch-alteration pitch) 0)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 (+ 2 notename) 0)))
    ((equal? (ly:pitch-alteration pitch) -1/2)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 (+ 2 notename) -1/2)))
    ((equal? (ly:pitch-alteration pitch) 1/2)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 (+ 2 notename) 0))))

  (set! (ly:music-property copy-note 'duration) (ly:make-duration 4))
  (set! (ly:music-property copy-note2 'duration) (ly:make-duration 4))
  #{
  \appoggiatura{ $copy-note2 $copy-note } 
  #}))

%% half step mordent
hmord = #(define-music-function (note) (ly:music?)
(let* ((copy-note (ly:music-deep-copy note))
       (pitch (ly:music-property copy-note 'pitch))
       (copy-note2 (ly:music-deep-copy note))
       (notename (ly:pitch-steps pitch))
       (duration (ly:music-property copy-note 'duration))
       (octave (ly:pitch-octave (ly:music-property note 'pitch))))
  (cond 
    ((equal? (ly:pitch-alteration pitch) 0)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 (- notename 1) 1/2)))
    ((equal? (ly:pitch-alteration pitch) -1/2)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 (- notename 1) 0)))
    ((equal? (ly:pitch-alteration pitch) 1/2)
     (set! (ly:music-property copy-note 'pitch) (ly:make-pitch 0 (- notename 1) 1))))

  (set! (ly:music-property copy-note 'duration) (ly:make-duration 4))
  (set! (ly:music-property copy-note2 'duration) (ly:make-duration 4))
  #{
  \appoggiatura{ $copy-note2 $copy-note } 
  #}))
