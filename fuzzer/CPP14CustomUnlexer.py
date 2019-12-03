from CPP14Unlexer import CPP14Unlexer

from grammarinator.runtime import *

def as_ord_list(l):
    return [ord(x) for x in l]

class CPP14CustomUnlexer(CPP14Unlexer):

    def Identifier(self):
        current = self.create_node(UnlexerRule(name='Identifier'))
        current += self.create_node(UnlexerRule(src=self.char_from_list(as_ord_list(['a', 'b', 'c', 'd', 'e', 'f']))))
        return current