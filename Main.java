import java.io.FileReader;
import java.io.FileNotFoundException;
import parser.*; 
import java_cup.runtime.Symbol;

public class Main {
    
    public static void main(String[] args) {
        if (args.length == 0) {
            System.err.println("Uso: java Main <nome_do_arquivo>");
            return;
        }

        String nomeArquivo = args[0];
        System.out.println("Iniciando a análise sintática do arquivo: " + nomeArquivo);
        
        try {
            Yylex lexer = new Yylex(new FileReader(nomeArquivo));
            Parser parser = new Parser((java_cup.runtime.Scanner) lexer);
            
            parser.parse();

        } catch (FileNotFoundException e) {
            System.err.println("Erro: Arquivo não encontrado: " + nomeArquivo);
        } catch (Exception e) {
            System.err.println("Erro durante a análise ou execução:");
            e.printStackTrace();
        }
    }
}