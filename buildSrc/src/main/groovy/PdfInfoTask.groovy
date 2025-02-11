import org.gradle.api.DefaultTask
import org.gradle.api.tasks.TaskAction
import org.gradle.api.tasks.InputFile

import org.apache.tika.metadata.Metadata
import org.apache.tika.parser.ParseContext
import org.apache.tika.parser.pdf.PDFParser
import org.apache.tika.sax.BodyContentHandler

/**
 * PDF 文書のメタデータを確認するユーティリティタスク
 *
 */
abstract class PdfInfoTask extends DefaultTask {
    /**
     * PDF 文書
     */
    @InputFile
    File pdfFile

    /**
     * Gradle タスクエントリーポイント
     */
    @TaskAction
    def checkPdfInfo() {
        def handler = new BodyContentHandler()
        def metadata = new Metadata()
        def input = new FileInputStream(pdfFile)
        def context = new ParseContext()

        def pdf = new PDFParser()
        pdf.parse(input, handler, metadata, context)

        metadata.names().sort().each { name ->
            println "${name}: ${metadata.get(name)}"
        }
    }
}
