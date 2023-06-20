def calc_eval(exp):
    if isinstance(exp, Pair):
        if exp.first == 'and': # and expressions
            return eval_and(exp.rest)
        else: # Call expressions
            return calc_apply(calc_eval(exp.first), list(exp.rest.map(calc_eval)))
    elif exp in OPERATORS: # Names
        return OPERATORS[exp]
    else: # Numbers
        return exp

def eval_and(operands):
    if operands.rest is nil:
        return calc_eval(operands.first)
    else:
        first = calc_eval(operands.first)
        if first is False:
            return False
        else:
            return eval_and(operands.rest)