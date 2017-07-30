#!/usr/bin/env ruby

runes = [
  {:name => 'Zod', :need => 0, :have => 0, :level => 'max'},
  {:name => 'Cham', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Flawless Emeralds'},
  {:name => 'Jah', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Flawless Rubies'},
  {:name => 'Ber', :need => 1, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Flawless Sapphires'},
  {:name => 'Sur', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Flawless Amethysts'},
  {:name => 'Lo', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Flawless Topazes'},
  {:name => 'Ohm', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Diamonds'},
  {:name => 'Vex', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Emeralds'},
  {:name => 'Gul', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Rubies'},
  {:name => 'Ist', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Sapphires'},
  {:name => 'Mal', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Amethysts'},
  {:name => 'Um', :need => 0, :have => 0, :level => 'high', :jewels => 0, :j_type => 'Topazes'},
  {:name => 'Pul', :need => 0, :have => 0, :level => 'mid', :jewels => 0, :j_type => 'Flawed Diamonds'},
  {:name => 'Lem', :need => 0, :have => 0, :level => 'mid', :jewels => 0, :j_type => 'Flawed Emeralds'},
  {:name => 'Fal', :need => 0, :have => 0, :level => 'mid', :jewels => 0, :j_type => 'Flawed Rubies'},
  {:name => 'Ko', :need => 0, :have => 0, :level => 'mid', :jewels => 0, :j_type => 'Flawed Sapphires'},
  {:name => 'Lum', :need => 0, :have => 3, :level => 'mid', :jewels => 0, :j_type => 'Flawed Amethysts'},
  {:name => 'Io', :need => 0, :have => 2, :level => 'mid', :jewels => 0, :j_type => 'Flawed Topazes'},
  {:name => 'Hel', :need => 0, :have => 2, :level => 'mid', :jewels => 0, :j_type => 'Chipped Diamonds'},
  {:name => 'Dol', :need => 0, :have => 0, :level => 'mid', :jewels => 0, :j_type => 'Chipped Emeralds'},
  {:name => 'Shael', :need => 0, :have => 4, :level => 'mid', :jewels => 0, :j_type => 'Chipped Rubies'},
  {:name => 'Sol', :need => 0, :have => 3, :level => 'mid', :jewels => 0, :j_type => 'Chipped Sapphires'},
  {:name => 'Amn', :need => 0, :have => 4, :level => 'mid', :jewels => 0, :j_type => 'Chipped Amethysts'},
  {:name => 'Thul', :need => 0, :have => 1, :level => 'mid', :jewels => 0, :j_type => 'Chipped Topazes'},
  {:name => 'Ort', :need => 0, :have => 1},
  {:name => 'Ral', :need => 0, :have => 0},
  {:name => 'Tal', :need => 0, :have => 0},
  {:name => 'Ith', :need => 0, :have => 0},
  {:name => 'Eth', :need => 0, :have => 0},
  {:name => 'Nef', :need => 0, :have => 0},
  {:name => 'Tir', :need => 0, :have => 0},
  {:name => 'Eld', :need => 0, :have => 0},
  {:name => 'El', :need => 0, :have => 0}
]
#  lowlevelrunearray = [ 'El', 'Eld', 'Tir', 'Nef', 'Eth', 'Ith', 'Tal', 'Ral', 'Ort', 'Thul' ]
#  midlevelrines = [ 'Amn', 'Sol', 'Shael', 'Dol', 'Hel', 'Io', 'Lum', 'Ko', 'Fal', 'Lem', 'Pul' ]
#  highlevelrunearray = [ 'Um', 'Mal', 'Ist', 'Gul', 'Vex', 'Ohm', 'Lo', 'Sur', 'Ber', 'Jah', 'Cham', 'Zod' ]

def print_by_level(runehash)
  if ['high', 'mid'].include?(runehash[:level])
    puts "#{runehash[:name]}: Have #{runehash[:have]}, Need #{runehash[:need]} plus #{runehash[:jewels]} #{runehash[:j_type]}"
  else
    puts "#{runehash[:name]}: Have #{runehash[:have]}, Need #{runehash[:need]}"
  end
end

def increment_rune_need_by_level(runehash)
  if ['max', 'high'].include?(runehash[:level])
    (runehash[:need] - runehash[:have]) * 2
  else
    (runehash[:need] - runehash[:have]) * 3
  end
end

def increment_jewel_need_by_level(runehash)
  if ['high', 'mid'].include?(runehash[:level])
    runehash[:need] - runehash[:have]
  else
    return 0
  end
end

def upgraderunes(runearray)
  if runearray[0][:need] == 0
    runearray.shift
    upgraderunes(runearray)
  elsif runearray[0][:have] >= runearray[0][:need]
    print_by_level(runearray[0])
    puts "You already have all the runes you need."
    return 0
  else
    runes_overload = increment_rune_need_by_level(runearray[0])
    jewels_overload = increment_jewel_need_by_level(runearray[0])
    print_by_level(runearray[0])
    if runearray[0][:name] == 'El'
      return 0
    else
      runearray.shift
      runearray[0][:need] = runearray[0][:need] + runes_overload 
      if ['high', 'mid'].include?(runearray[0][:level])
        runearray[0][:jewels] = runearray[0][:jewels] + jewels_overload
      end
      upgraderunes(runearray)
    end
  end
end

upgraderunes(runes)
