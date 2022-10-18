class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i+=1
        end
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each do |x|
            if prc.call(x)
                arr<<x
            end
        end
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each do |x|
            if !prc.call(x)
                arr<<x
            end
        end
        arr
    end

    def my_any?(&prc)
        self.my_each do |x|
            if prc.call(x)
                return true
            end
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |x|
            if !prc.call(x)
                return false
            end
        end
        return true
    end

    def my_flatten
        flat = []
        self.each do |x|
            if x.is_a?(Array)
                flat = flat + x.my_flatten
            else
                flat<<x
            end
        end
        flat
    end

    def my_zip(*args)
        arr = []
        (0...self.length).each do |x|
            temp = [self[x]]
            args.each do |a|
                temp<<a[x]
            end
            arr<<temp
        end
        return arr
    end

    def my_rotate(num=1)
        arr = []
        self.each do |x|
            arr<<x
        end

        if num > 0
            num.times do |x|
                arr<<arr.shift
            end
        elsif num < 0
            (num*-1).times do |x|
                #todo
            end
        end

        return arr
    end

    def my_join(sep="")
        str = ""
        self.each_with_index do |x,i|
            if self[i+1]
                str<<self[i]+sep
            else
                str<<self[i]
            end
        end
        return str
    end

    def my_reverse
        arr = []
        i = self.length-1
        while i >= 0
            arr<<self[i]
            i -= 1
        end
        return arr
    end

end
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]