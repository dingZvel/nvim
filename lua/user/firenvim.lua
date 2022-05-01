-- TODO Migrate this file to lua

vim.cmd [[
  if exists('g:started_by_firenvim')
    set laststatus=0
    set guifont=FiraCode\ NF:h10
    au BufEnter github.com_*.txt set filetype=markdown


    let g:timer_started = v:false
    function! My_Write(timer) abort
      let g:timer_started = v:false
      write
    endfunction

    function! Delay_My_Write() abort
      if g:timer_started
        return
      end
      let g:timer_started = v:true
      call timer_start(10000, 'My_Write')
    endfunction

    au TextChanged * ++nested call Delay_My_Write()
    au TextChangedI * ++nested call Delay_My_Write()
  endif
]]
