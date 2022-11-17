""" Utils """

def str_to_code(word, max_length=9):
  """ ABC -> 234 """

  def addth(num: int) -> int:
    """ 111 => 3 """
    if num < 10:
      return num
    return addth( (num // 10) + (num % 10) )

  num = 0
  word = word.replace(' ', '')

  for char in word:
    if max_length == 0:
      return num
    num += addth(ord(char)) * pow(10, max_length-1)
    max_length -= 1

  return num
