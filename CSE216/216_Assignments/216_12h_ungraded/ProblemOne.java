import java.util.Arrays;
import java.util.IntStream;
import java.util.function.IntBinaryOperator;
import java.util.stream.Stream;
import java.io.PrintStream;

public class ProblemOne {
    public static void main(String[] args) {
        java.util.stream.IntStream stream = new IntStream();
        List<Integer> list = Arrays.asList(1, 2, 3, 4, 5);
        IntBinaryOperator incr = x -> x + 1;
        int sum = stream.reduce(0, incr);
    }
}