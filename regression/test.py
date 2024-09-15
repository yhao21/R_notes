import numpy as np
import pandas as pd
import re



'''
Index(['Month', 'Expectation', 'Inflation_current', 'Inflation_month_ago',
       'D_inf_current', 'D_inf_month_ago', 'Inflation_year_ahead', 'Diff',
       'Error', 'D_Diff', 'D_Error', 'MoM_adjustment', 'YoY_adjustment',
       'Expectation_month_ago', 'Expectation_year_ago'],
'''



data = pd.read_csv('./michigan_dataset.csv')


n = 100
df = data.iloc[:n, 1:4].values
#df = data.iloc[:3, 1:3].values
y = df[:, :1]
x = df[:, 1:]
a = np.ones([n,1])
x = np.hstack((a,x))


b = np.dot(np.dot(np.linalg.inv(np.dot(x.T, x)), x.T), y)


def lm(formula, data, obs = data.shape[0], constant = True):
    data = data[:obs]

    formula = ''.join(formula.split(' '))
    # get column names for Y variables.
    y_label = re.findall('(\w*)~.', formula)[0]
    # get column names for X variables.
    x_label = formula[formula.index('~')+1:].split('+')

    y = data[y_label].values
    x = data[x_label].values
    if constant:
        # add constant term in X matrix
        x = np.hstack((np.ones([obs, 1]), x))

    b = np.dot(np.dot(np.linalg.inv(np.dot(x.T, x)), x.T), y).round(5)
    result_variable = ['Const'] + x_label
    #   report result
    summary = np.vstack((result_variable, b))


    # y: n*1, x: n*k, b: k*1
    e = y - np.dot(x, b)
    K = len(result_variable)
    sigma2 = np.dot(e.T, e)/(n - K)
    
    e_std_error = np.sqrt(sigma2)   #   Residual standard error
    DOF = obs - K                   #   Degree of freedom

    # std error matrix of betas
    beta_std_error = np.sqrt(sigma2 * np.linalg.inv(np.dot(x.T, x)))


    #   t-statistics
    t = np.diag(b/beta_std_error)

    print(b)
    print(sigma2)
    print(np.diag(beta_std_error).round(4))
    print(DOF)
    print(t)



lm('Expectation~Inflation_current + Inflation_month_ago', data, obs = 100)



a = 'Expectation~Inflation_current +  Inflation_month_ago'



#print(a.index('~'))
#b = a[a.index('~')+1:].split('+')
#print(b)









