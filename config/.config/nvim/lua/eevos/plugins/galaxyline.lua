-- Galaxyline
-- https://github.com/nvimdev/galaxyline.n vim

local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

-- local colors = require('galaxyline.theme').default
local colors = {
  -- bg = '#2E2E2E',
  bg = '#090B10',
  yellow = '#DCDCAA',
  dark_yellow = '#D7BA7D',
  cyan = '#4EC9B0',
  green = '#608B4E',
  light_green = '#B5CEA8',
  string_orange = '#CE9178',
  orange = '#FF8800',
  purple = '#C586C0',
  magenta = '#D16D9E',
  grey = '#858585',
  blue = '#569CD6',
  vivid_blue = '#4FC1FF',
  light_blue = '#9CDCFE',
  red = '#D16969',
  error_red = '#F44747',
  info_yellow = '#FFCC66'
}

gl.short_line_list = {
  'NvimTree',
  'vista',
  'dbui',
  'packer'
}

-- Status bar modules

gls.left[0] = {
  ViMode = {
    provider = function()
      local mode = vim.fn.mode()

      NVIM_MODES = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        v = 'VISUAL LINE',
        V = 'VISUAL',
        R = 'REPLACE'
      }
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        v = colors.purple,
        [''] = colors.purple,
        V = colors.purple,
        c = colors.magenta,
        no = colors.blue,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.red,
        Rv = colors.red,
        cv = colors.blue,
        ce = colors.blue,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.blue,
        t = colors.blue
      }
      vim.api
          .nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
      return '▊ ' .. mode
    end,
    separator = ' ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.red,
      colors.bg
    }
  }
}

-- gls.left[1] = {
--   WorkingDirectory = {
--     provider = function()
-- 			local home = vim.env.HOME
-- 			local pwd = vim.fn.getcwd()
--       return ' ' .. pwd
--     end,
--     separator = ' ',
--     separator_highlight = {
--       'NONE',
--       colors.bg
--     },
--     highlight = {
--       colors.grey,
--       colors.bg
--     }
--   }
-- }

gls.left[2] = {
  GitIcon = {
    provider = function()
      return ''
    end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.orange,
      colors.bg
    }
  }
}

gls.left[3] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.grey,
      colors.bg
    }
  }
}

gls.left[4] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = {
      colors.green,
      colors.bg
    }
  }
}

gls.left[5] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {
      colors.blue,
      colors.bg
    }
  }
}

gls.left[6] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    separator = ' ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.red,
      colors.bg
    }
  }
}

gls.left[7] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon_color,
      colors.bg
    }
  }
}

gls.left[8] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {
      colors.blue,
      colors.bg
    }
  }
}


gls.left[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {
      colors.error_red,
      colors.bg
    }
  }
}

gls.left[10] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ',
    highlight = {
      colors.orange,
      colors.bg
    }
  }
}

gls.left[11] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {
      colors.vivid_blue,
      colors.bg
    }
  }
}

gls.left[12] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {
      colors.info_yellow,
      colors.bg
    }
  }
}

-- Right side of the status Bar


gls.right[1] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.grey,
      colors.bg
    }
  }
}

gls.right[2] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.grey,
      colors.bg
    }
  }
}

gls.right[3] = {
  Tabstop = {
    provider = function()
      return " " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
    end,
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.grey,
      colors.bg
    }
  }
}

gls.right[4] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = {
        [' '] = true
      }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' ',
    separator = ' ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.info_yellow,
      colors.bg
    }
  }
}

gls.right[5] = {
  BufferType = {
    provider = 'FileTypeName',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.blue,
      colors.bg
    }
  }
}

gls.right[9] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = '  ',
    separator_highlight = {
      'NONE',
      colors.bg
    },
    highlight = {
      colors.grey,
      colors.bg
    }
  }
}

-- Short status bar modules

gls.short_line_left[1] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {
      colors.blue,
      colors.bg
    }
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {
      colors.grey,
      colors.bg
    }
  }
}
