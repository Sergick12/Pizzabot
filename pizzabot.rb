# frozen_string_literal: true


  def move_bot(point)
    @pb_point = point
    @pb_x_y = (@pb_point.split('') - ['(', ')', ',', ' ', 'x', @pb_point[0], @pb_point[1]]).map(&:to_i)
    head = [0, 0]
    x = 0
    while x < @pb_x_y.length do
      if head[0] < @pb_x_y[x] && head[0] + @pb_x_y[x] <= @pb_point[0].to_i
        (0...(@pb_x_y[x] - head[0])).each { |x|
          print '—'
        }
        head[0] = @pb_x_y[x]
      elsif head[0] > @pb_x_y[x] && head[0] - @pb_x_y[x] >= 0
        (0...head[0] - @pb_x_y[x]).each {
          print '—'
        }
        head[0] = @pb_x_y[x]
      end
      if head[1] < @pb_x_y[x + 1] && @pb_x_y[x + 1] <= @pb_point[2].to_i
        (0...(@pb_x_y[x + 1] - head[1])).each {
          print '|'
        }
        head[1] = @pb_x_y[x + 1]
      elsif head[1] > @pb_x_y[x + 1] && head[1] - @pb_x_y[x + 1] >= 0
        (0...head[1] - @pb_x_y[x + 1]).each {
          print '|'
        }
        head[1] = @pb_x_y[x + 1]
      end
      p head
      x += 2
    end
  end
move_bot(('5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1) '))