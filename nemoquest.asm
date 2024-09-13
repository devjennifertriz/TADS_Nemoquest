.text

reiniciar:
	addi $4, $0, 200
	addi $2, $0, 32
	syscall
	addi $1, $0, 0
	addi $2, $0, 0
	addi $3, $0, 0
	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 0
	addi $7, $0, 0
	addi $8, $0, 0
	addi $9, $0, 0
	addi $10, $0, 0
	addi $11, $0, 0
	addi $12, $0, 0
	addi $13, $0, 0
	addi $14, $0, 0
	addi $15, $0, 0
	addi $16, $0, 0
	addi $17, $0, 0
	addi $18, $0, 0
	addi $19, $0, 0
	addi $20, $0, 0
	addi $21, $0, 0
	addi $22, $0, 0
	addi $23, $0, 0
	addi $24, $0, 0
	addi $25, $0, 0

main:	lui $9, 0x1001 #primeiro endereï¿½o da tela, sempre comeï¿½ando pelo 0x1001 --> a tela possui 512 de largura e 256 de altura
	addi $10, $0, 0x0084ff #adicionando uma cor no $10, utilizando o hexadecimal da cor apï¿½s o 0x!
	#KILLNEMOQUEST
	addi $15, $0, 8192 #para guardar na memï¿½ria, cada px pintado em uma tela inteira serï¿½ 8192
	
tela_azul: #loop para pintar tela
	beq $15, $16, main_1
	addi $16, $16, 1 #adicionando um contador para o loop
	
	sw $10, 0($9) #o sw pega a cor que estï¿½ armazenada no $10 e guarda na memï¿½ria no endereï¿½o apontado para o $9
	sw $10, 33000($9)
	#pegando prï¿½ximo endereï¿½o
	addi $9, $9, 4
	j tela_azul
	
main_1:
	lui $9, 0x1001
	addi $10, $0, 0xffefd5 #adicionando a cor da areia
	addi $9, $9, 28160 #buscando o px em especï¿½fico da tela
	sw $10, 33000($9)
	#sw $10, 0($9) 9testar onde o ponto estï¿½ pintado na tela
	addi $16, $0, 0 #resetar o contador
	
	addi $15, $0, 2000 #testando a ï¿½rea para pintar (nï¿½o necessï¿½rio repetir 8192 vezes)
	
tela_areia:
	beq $15, $16, sol
	addi $16, $16, 1
	#jal criar_linha (exemplo: utilizando da funï¿½ï¿½o criar linha a partir do jal, e entï¿½o ele pularia para o criar_linha) 
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	j tela_areia

sol:	
	lui $9, 0x1001
	addi $10, $0, 0xffa726
	addi $16, $0, 0
	#resetando para criar linha
	addi $15, $0, 384
	sw $10, 33000($9)
	jal criar_linha
	
	addi $10, $0, 0xff9800  
	addi $16, $0, 0
	addi $15, $0, 256
	sw $10, 33000($9)
	jal criar_linha
	
	addi $10, $0, 0xf57c00 
	addi $16, $0, 0
	addi $15, $0, 256
	sw $10, 33000($9)
	jal criar_linha
	
	addi $10, $0, 0xef6c00 
	addi $16, $0, 0
	addi $15, $0, 256
	sw $10, 33000($9)
	jal criar_linha 
	
	j mar_topo
	
criar_linha: #funï¿½ï¿½o criada para algo em especï¿½fico, criando um loop
	beq $15, $16, voltar #pula pro voltar
	addi $16, $16, 1
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	j criar_linha

onda:	
	lui $9, 0x1001
	addi $10, $0, 0x2156a2
	addi $9, $9, 6684
	sw $10, 33000($9)
	jal f_onda
	
	addi $9, $9, -472
	sw $10, 33000($9)
	jal f_onda
	
	addi $9, $9, 552
	sw $10, 33000($9)
	jal f_onda
	
	addi $9, $9, -292
	sw $10, 33000($9)
	jal f_onda
	
	addi $9, $9, 552
	sw $10, 33000($9)
	jal f_onda
	
	addi $9, $9, -472
	sw $10, 33000($9)
	jal f_onda
	
	j submarino_address
	
f_onda:
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9,$9, -508
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9,$9, 516
	sw $10, 0($9)
	sw $10, 33000($9)
	j voltar
	
mar_topo:
	lui $9, 0x1001 
	addi $10, $0, 0x1b6dd0
	addi $9, $9, 4608 #escolhe um ponto na tela
	addi $16, $0, 0
	addi $15, $0, 128 #adiciona um valor para pintar (recomendo comeï¿½ar com 4)
	sw $10, 33000($9)
	jal criar_linha

	j mar_profundo
	
mar_profundo:
	lui $9, 0x1001
	addi $10, $0, 0x1b6dd0
	addi $9, $9, 14848
	addi $16, $0, 0
	addi $15, $0, 1024
	sw $10, 33000($9)
	jal criar_linha
	
	addi $10, $0, 0x2156a2
	addi $16, $0, 0
	addi $15, $0, 1024
	sw $10, 33000($9)
	jal criar_linha
	
	addi $10, $0, 0x214177
	addi $16, $0, 0
	addi $15, $0, 1408
	sw $10, 33000($9)
	jal criar_linha
	
	j monte
		
monte_areia:	#funï¿½ï¿½o para criar um "montinho" de areia
	addi $10, $0, 0xffefd5
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4 #adicionando ao prï¿½ximo
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4 
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	
	addi $9, $9, -528 #voltando na diagonal
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, -4
	sw $10, 0($9)
	sw $10, 33000($9)
	
	addi $9, $9, -496
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	addi $9, $9, 4
	sw $10, 0($9)
	sw $10, 33000($9)
	
	j voltar
			
monte:	
	lui $9, 0x1001
	addi $9, $9, 28148
	sw $10, 33000($9)
	jal monte_areia
	
	addi $9, $9, 1084
	sw $10, 33000($9)
	jal monte_areia
	
	addi $9, $9, 1084
	sw $10, 33000($9)
	jal monte_areia
	
	addi $9, $9, 1084
	sw $10, 33000($9)
	jal monte_areia
			
	j onda
	
nemo_address:
	lui $11, 0x1001 #começando a ser desenhado no $11
	addi $12, $11, 15288 #adicionando o lui do primeiro endereço da tela e adicionando no $12 (novo registrador)
	addi $11, $11, 21880
	addi $1, $0, 0
	j d_nemo #controlar o registrador de movimento
	
d_nemo: #desenhar o peixe na tela
	addi $9, $11, 0
	addi $10, $0, 0xff8c00
	addi $16, $0, 0
	addi $15, $0, 6
	jal criar_linha_vert
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 4
	jal criar_linha_vert
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 2
	addi $10, $0, 0xffffff
	jal criar_linha_vert
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 4
	addi $10, $0, 0xff8c00
	jal criar_linha_vert
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 6
	addi $10, $0, 0xffffff
	jal criar_linha_vert
	
	addi $9, $9, -3580
	addi $16, $0, 0
	addi $15, $0, 8
	addi $10, $0, 0xff8c00
	jal criar_linha_vert
	
	addi $9, $9, -3580
	addi $16, $0, 0
	addi $15, $0, 6
	addi $10, $0, 0xffffff
	jal criar_linha_vert
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 4
	addi $10, $0, 0xff8c00
	jal criar_linha_vert
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 2
	jal criar_linha_vert
	
	addi $9, $9, -1028
	addi $10, $0, 0x000000
	sw $10, 0($9)

	j move_nemo
	
move_nemo:
	addi $4, $0, 100
	addi $2, $0, 32
	syscall
	jal apagar_nemo
	addi $11, $11, 12 #movendo apenas o primeiro ponto, de 8 em 8
	addi $13, $13, 1
	beq $13, 20, mudar_posic #comparando a posição, inicial
	j nemo
	
mudar_posic: #usando o registrado $13, será o contador para quando o peixe se mover x vezes, mudar a posição inicial para duas linhas a baixo ou a cima (1024/-1024, invertido ou não)
	addi $4, $0, 100
	addi $2, $0, 32
	syscall
	jal apagar_nemo
	addi $11, $11, -512
	addi $13, $0, 0
	j nemo
	
nemo: #desenhar o peixe na tela
	addi $9, $11, 0
	addi $10, $0, 0xff8c00
	addi $16, $0, 0
	addi $15, $0, 6
	jal criar_linha_vert
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 4
	jal criar_linha_vert
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 2
	addi $10, $0, 0xffffff
	jal criar_linha_vert
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 4
	addi $10, $0, 0xff8c00
	jal criar_linha_vert
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 6
	addi $10, $0, 0xffffff
	jal criar_linha_vert
	
	addi $9, $9, -3580
	addi $16, $0, 0
	addi $15, $0, 8
	addi $10, $0, 0xff8c00
	jal criar_linha_vert
	
	addi $9, $9, -3580
	addi $16, $0, 0
	addi $15, $0, 6
	addi $10, $0, 0xffffff
	jal criar_linha_vert
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 4
	addi $10, $0, 0xff8c00
	jal criar_linha_vert
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 2
	jal criar_linha_vert
	
	addi $9, $9, -1028
	addi $10, $0, 0x000000
	sw $10, 0($9)
	j verificar_teclado
	
apagar_nemo:  
	addi $25, $31, 0
	addi $9, $11, 0
	addi $16, $0, 0
	addi $15, $0, 6
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 4
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 2
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 4
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 6
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -3580
	addi $16, $0, 0
	addi $15, $0, 8
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -3580
	addi $16, $0, 0
	addi $15, $0, 6
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -2556
	addi $16, $0, 0
	addi $15, $0, 4
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -1532
	addi $16, $0, 0
	addi $15, $0, 2
	lw $10, 33000($9)
	jal criar_linha_vert_apagar
	
	addi $9, $9, -1028
	lw $10, 33000($9)
	sw $10, 0($9)

	jr $25
																						
criar_linha_vert:
	beq $15, $16, voltar #pula pro voltar
	addi $16, $16, 1
	sw $10, 0($9)
	addi $9, $9, 512
	j criar_linha_vert
	
criar_linha_vert_apagar:
	beq $15, $16, voltar #pula pro voltar
	addi $16, $16, 1
	sw $10, 0($9)
	addi $9, $9, 512
	lw $10, 33000($9)
	j criar_linha_vert_apagar
	
criar_linha_apagar: #funï¿½ï¿½o criada para algo em especï¿½fico, criando um loop
	beq $15, $16, voltar #pula pro voltar
	addi $16, $16, 1
	sw $10, 0($9)
	addi $9, $9, 4
	lw $10, 33000($9)
	j criar_linha_apagar
	
verificar_teclado:
	addi $17, $19, 80
	lw $24, 0($17) 
	beq $24, 0xff8c00, tela
	addi $17, $19, 0
	lw $24, 0($17) 
	beq $24, 0xff8c00, tela
	addi $17, $19, 508
	lw $24, 0($17) 
	beq $24, 0xff8c00, tela
	addi $17, $19, 1988
	lw $24, 0($17) 
	beq $24, 0xff8c00, tela
	lui $17, 0xffff
	lw $18, 4($17)
	
	beq $18, 'd', mover_direita
	
	beq $18, 'w', mover_cima
	
	beq $18, 's', mover_baixo
	
	beq $18, 'a', mover_esquerda
	
	beq $18, ' ', shoot_nemo
	
	j move_nemo

mover_direita:
	sw $0, 4($17) 
	jal submarino_direita_apagar
	addi $4, $0, 200
	addi $2, $0, 32
	syscall
	addi $19, $19, 28
	j submarino_direita

mover_cima:
	sw $0, 4($17) 
	jal submarino_direita_apagar
	addi $4, $0, 200
	addi $2, $0, 32
	syscall
	addi $19, $19, -1024
	j submarino_direita

mover_baixo:
	sw $0, 4($17) 
	jal submarino_direita_apagar
	addi $4, $0, 200
	addi $2, $0, 32
	syscall
	addi $19, $19, 1024
	j submarino_direita

mover_esquerda:
	sw $0, 4($17) 
	jal submarino_direita_apagar
	addi $4, $0, 200
	addi $2, $0, 32
	syscall
	addi $19, $19, -28
	j submarino_direita

criar_linha_sub: #funï¿½ï¿½o criada para algo em especï¿½fico, criando um loop
	beq $15, $16, voltar #pula pro voltar
	addi $16, $16, 1
	sw $10, 0($9)
	addi $9, $9, 4
	j criar_linha_sub

submarino_address:
	lui $19, 0x1001
	addi $19, $19, 18512
	addi $1, $0, 1
	j d_submarino_direita
	
d_submarino_direita:
	addi $9, $19, 0
	addi $10, $0, 0xf9ff00
	addi $15, $0, 3
	addi $16, $0, 0
	jal criar_linha_sub
	addi $9, $9, 492
	addi $15, $0, 5
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 492
	addi $15, $0, 5
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 464
	addi $15, $0, 15
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 444
	addi $15, $0, 17
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 452
	addi $15, $0, 14
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, -1600
	addi $15, $0, 2
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 2040
	addi $15, $0, 2
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, -1500
	addi $10, $0, 0x214177
	addi $16, $0, 0
	addi $15, $0, 2
	jal criar_linha_sub
	j nemo_address
		
submarino_direita:
	addi $9, $19, 0
	addi $10, $0, 0xf9ff00
	addi $15, $0, 3
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 492
	addi $15, $0, 5
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 492
	addi $15, $0, 5
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 464
	addi $15, $0, 15
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 444
	addi $15, $0, 17
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 452
	addi $15, $0, 14
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, -1600
	addi $15, $0, 2
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 2040
	addi $15, $0, 2
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, -1500
	addi $10, $0, 0x214177
	addi $16, $0, 0
	addi $15, $0, 2
	jal criar_linha_sub
	j move_nemo
	
submarino_direita_apagar:
	addi $25, $31, 0
	addi $9, $19, 0
	addi $15, $0, 3
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 492
	addi $15, $0, 5
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 492
	addi $15, $0, 5
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 464
	addi $15, $0, 15
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 444
	addi $15, $0, 17
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 452
	addi $15, $0, 14
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, -1600
	addi $15, $0, 2
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 2040
	addi $15, $0, 2
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, -1500
	addi $16, $0, 0
	addi $15, $0, 2
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	jr $25

submarino_esquerda:
	addi $9, $9, 12124
	addi $10, $0, 0xf9ff00
	addi $15, $0, 15
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 452
	addi $15, $0, 17
	addi $16, $0, 0
	jal criar_linha_sub
	
	addi $9, $9, 448
	addi $16, $0, 0
	addi $15, $0, 14
	jal criar_linha_sub
	
	addi $9, $9, -1584
	addi $16, $0, 0
	addi $15, $0, 5
	jal criar_linha_sub
	
	addi $9, $9, -532
	addi $16, $0, 0
	addi $15, $0, 5
	jal criar_linha_sub
	
	addi $9, $9, -532
	addi $16, $0, 0
	addi $15, $0, 3
	jal criar_linha_sub
	
	addi $9, $9, 1060
	addi $16, $0, 0
	addi $15, $0, 2
	jal criar_linha_sub
	
	addi $9, $9, 2040
	addi $16, $0, 0
	addi $15, $0, 2
	jal criar_linha_sub
	
	addi $9, $9, -1588
	addi $10, $0, 0x214177
	addi $16, $0, 0
	addi $15, $0, 2
	jal criar_linha_sub
	
	j submarino_direita
	
submarino_esquerda_apagar:
	addi $25, $31, 0
	addi $9, $9, 12124
	addi $15, $0, 15
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 452
	addi $15, $0, 17
	addi $16, $0, 0
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 448
	addi $16, $0, 0
	addi $15, $0, 14
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, -1584
	addi $16, $0, 0
	addi $15, $0, 5
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, -532
	addi $16, $0, 0
	addi $15, $0, 5
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, -532
	addi $16, $0, 0
	addi $15, $0, 3
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 1060
	addi $16, $0, 0
	addi $15, $0, 2
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, 2040
	addi $16, $0, 0
	addi $15, $0, 2
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	addi $9, $9, -1588
	addi $16, $0, 0
	addi $15, $0, 2
	lw $10, 33000($9)
	jal criar_linha_apagar
	
	jr $25	
	
shoot_nemo:
	sw $0, 4($17)
	addi $10, $0, 0xffff00
	addi $9, $19, 1564
	jal criar_linha_shoot
	
	lw $24, 0($9)
	beq $24, 0xff8c00, teste_fim
	
	addi $9, $9, -12
	lw $10, 33000($9)
	jal apagar_linha_shoot
	
	addi $9, $9, 12
	addi $10, $0, 0xffff00
	jal criar_linha_shoot
	
	
	addi $9, $9, -12
	lw $10, 33000($9)
	jal apagar_linha_shoot
	
	addi $9, $9, 12
	addi $10, $0, 0xffff00
	jal criar_linha_shoot
	
	
	addi $9, $9, -12
	lw $10, 33000($9)
	jal apagar_linha_shoot
	
	j move_nemo
	
criar_linha_shoot:
	sw $10, 0($9)
	addi $9, $9, 4
	lw $24, 0($9)
	beq $24, 0xff8c00, reiniciar
	sw $10, 0($9)
	addi $9, $9, 4
	lw $24, 0($9)
	beq $24, 0xff8c00, reiniciar
	sw $10, 0($9)
	addi $9, $9, 4
	lw $24, 0($9)
	beq $24, 0xff8c00, reiniciar
	sw $10, 0($9)
	addi $4, $0, 100
	addi $2, $0, 32
	syscall 
	
	jr $31
	
apagar_linha_shoot:
	sw $10, 0($9)
	addi $9, $9, 4
	lw $10, 33000($9)
	
	sw $10, 0($9)
	addi $9, $9, 4
	lw $10, 33000($9)
	
	sw $10, 0($9)
	addi $9, $9, 4
	lw $10, 33000($9)
	
	sw $10, 0($9)
	addi $9, $9, 4
	lw $10, 33000($9)
	
	sw $10, 0($9)
	
	jr $31

tela:
	addi $15, $0, 8192
	addi $10, $0, 0xff0000
	addi $16, $0, 0
	lui $9, 0x1001
	
tela_vermelha:
	beq $15, $16, teste_fim
	addi $16, $16, 1
	sw $10, 0($9) 
	addi $9, $9, 4
	j tela_vermelha
voltar:
	jr $31 #o jr volta para a linha seguinte em que, o $31 guardarï¿½ o endereï¿½o seguinte ao "jal", assim voltando para a linha seguinte

teste_fim:
	addi $2, $0, 10	
	syscall #finalizar programa
