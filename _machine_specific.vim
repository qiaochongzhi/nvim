" 本机专属配置：init.lua 会在加载 core/env.lua 之前 source 本文件。
" 这里只放“随机器变化”的覆盖项；没匹配到的项目会由 core/env.lua 自动探测。

" Python provider：优先当前 conda 环境，其次是 ~/anaconda3 下的解释器。
" 前提是该 Python 已经安装 pynvim（pip install pynvim）。
function! s:has_pynvim(python) abort
  if !executable(a:python)
    return 0
  endif
  let l:prefix = fnamemodify(a:python, ':h:h')
  return !empty(glob(l:prefix . '/lib/python*/site-packages/pynvim'))
        \ || !empty(glob(l:prefix . '/Lib/site-packages/pynvim'))
endfunction

let s:candidates = []
if !empty($CONDA_PREFIX)
  call add(s:candidates, $CONDA_PREFIX . '/bin/python')
endif
call add(s:candidates, expand('~/anaconda3/bin/python'))

for s:python in s:candidates
  if s:has_pynvim(s:python)
    let g:python3_host_prog = s:python
    break
  endif
endfor

unlet! s:candidates s:python
delfunction s:has_pynvim

" PDF 阅读器默认由 core/env.lua 按系统探测（macOS→Skim，Linux→okular/zathura）。
" 如需强制指定，取消下面一行的注释并改成 skim / okular / zathura / general：
" let g:vimtex_view_method = 'skim'
