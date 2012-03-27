module HealthInspector
  module Color
    def color(type, str)
      colors = {
        'pass'          => 90,
        'fail'          => 31,
        'bright pass'   => 92,
        'bright fail'   => 91,
        'bright yellow' => 93,
        'pending'       => 36,
        'suite'         => 0,
        'error title'   => 0,
        'error message' => 31,
        'error stack'   => 90,
        'checkmark'     => 32,
        'fast'          => 90,
        'medium'        => 33,
        'slow'          => 31,
        'green'         => 32,
        'light'         => 90,
        'diff gutter'   => 90,
        'diff added'    => 42,
        'diff removed'  => 41
      }

      "\e[%sm%s\e[0m" % [ colors[type], str ]
    end
  end
end