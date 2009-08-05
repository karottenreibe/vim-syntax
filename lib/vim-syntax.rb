
require 'syntax'

#
# Syntax highlighting for vim script code.
#
# Produces the following tokens:
# - comment
# - string
# - number
# - key
# - punct
# - whitespace
# - command
# - word
#
class VimTokenizer < Syntax::Tokenizer

    def step
        @got_command ||= false

        if comment = scan(%r{\n".*?$}) # full line comment
            start_group(:comment, comment)
        elsif comment = scan(%r{"[^"]*?$}) # end of line comment
            start_group(:comment, comment)
        elsif string = scan(%r{"[^"]*?"|'[^']*?'})
            start_group(:string, string)
        elsif number = scan(%r{\d+})
            start_group(:number, number)
        elsif key = scan(%r{<[^<]+>})
            start_group(:key, key)

        elsif punct = scan(%r{[^\w\süöäß]})
            start_group(:punct, punct)
        elsif space = scan(%r{\s})
            @got_command = false if space == "\n"
            start_group(:whitespace, space)

        elsif not @got_command and command = scan(%r{\w+})
            @got_command =  true
            start_group(:command, command)
        else
            start_group(:word, scan(%r{.}))
        end
    end

end

Syntax::SYNTAX['vim'] = VimTokenizer

