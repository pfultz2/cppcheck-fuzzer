
from grammarinator.runtime import *
from CPP14Unparser import CPP14Unparser


class CPP14CustomUnparser(CPP14Unparser):

    def __init__(self, unlexer):
        super(CPP14CustomUnparser, self).__init__(unlexer)

    # Skip generating attribute specifier
    def attributespecifier(self):
        current = self.create_node(UnparserRule(name='attributespecifier'))
        return current


