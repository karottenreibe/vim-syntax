
require 'syntax'

class VimTokenizer < Syntax::Tokenizer

    def step
        @got_command ||= false

        if comment = scan(%r{"[^"]*$|^".*$})
            start_group(:comment, comment)
        elsif string = scan(%r{"[^"]*"|'[^']*'})
            start_group(:string, string)
        elsif scan(%r{function (\w+)\(\)(.*?)endfunction}m)
            start_group(:command, 'function')
            start_group(:functionname, subgroup(1))
            start_group(:functionbody, subgroup(2))
        elsif number = scan(%r{\d+})
            start_group(:number, number)
        elsif key = scan(%r{<[^<]+>})
            start_group(:key, key)

        elsif punct = scan(%r{[^\w\s]})
            start_group(:punct, punct)
        elsif space = scan(%r{\s})
            @got_command = false if space == "\n"
            start_group(:whitespace, space)

        elsif not @got_command and command = scan(%r{\w+})
            @got_command =  true
            start_group(:command, command)
        else
            start_group(:param, scan(%r{.}))
        end
    end

end

Syntax::SYNTAX['vim'] = VimTokenizer
