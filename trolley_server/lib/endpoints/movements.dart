import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/hotmail.dart';
import 'package:serverpod/serverpod.dart';
import 'package:trolley_server/src/generated/protocol.dart';

class MovementsEndpoint extends Endpoint {
  late String password;
  late String email;

  SmtpServer? mailServer;

  MovementsEndpoint() {
    Map env = Platform.environment;
    password = env["W_PSSWD"];
    email = env["W_EMAIL"];
    mailServer = hotmail(email, password);
  }
  String stillageMovementEmailHtml = '''
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Stillage Movement Notification</title><style type="text/css">body {margin: 0;padding: 0;font-family: 'Inter', sans-serif;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;background-color: #f4f4f4;color: #333333;}table {border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;width: 100%;}td {padding: 0;}img {-ms-interpolation-mode: bicubic;border: 0;height: auto;line-height: 100%;outline: none;text-decoration: none;}a {text-decoration: none;}.email-container {max-width: 600px;margin: 0 auto;background-color: #ffffff;border-radius: 8px;overflow: hidden;box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);}.header {background-color: #4A90E2;padding: 20px 0;text-align: center;border-top-left-radius: 8px;border-top-right-radius: 8px;}.header img {max-width: 150px;height: auto;border-radius: 8px;}.header h1 {color: #ffffff;font-size: 24px;margin: 10px 0 0 0;padding: 0 20px;}.automated-email-banner {background-color: #FFD700; /* Gold-like color for attention */display: inline-block;padding: 10px 20px;border-radius: 5px;font-weight: bold;color: #333333;font-size: 20px;margin-bottom: 10px;}.content-area {padding: 20px 30px;line-height: 1.6;color: #555555;}.content-area p {margin-bottom: 15px;}.details-table {width: 100%;border: 1px solid #eeeeee;border-radius: 8px;overflow: hidden;margin-top: 20px;margin-bottom: 20px;}.details-table th, .details-table td {padding: 12px 15px;text-align: left;border-bottom: 1px solid #eeeeee;}.details-table th {background-color: #f8f8f8;font-weight: bold;color: #333333;width: 35%;}.details-table td {background-color: #ffffff;color: #666666;width: 65%;}.details-table tr:last-child th, .details-table tr:last-child td {border-bottom: none;}.details-table tr:nth-child(even) {background-color: #fdfdfd;}.footer {background-color: #f0f0f0;padding: 20px 30px;text-align: center;font-size: 12px;color: #999999;border-bottom-left-radius: 8px;border-bottom-right-radius: 8px;}.footer p {margin: 0;}.footer a {color: #4A90E2;text-decoration: underline;}@media only screen and (max-width: 620px) {.email-container {width: 100% !important;max-width: none !important;border-radius: 0 !important;}.header h1 {font-size: 20px !important;}.content-area {padding: 15px 20px !important;}.details-table th, .details-table td {padding: 10px 12px !important;display: block;width: 100% !important;box-sizing: border-box;}.details-table th {background-color: #e8e8e8;border-radius: 4px 4px 0 0;}.details-table td {border-radius: 0 0 4px 4px;margin-bottom: 10px;}.details-table tr {margin-bottom: 15px;display: block;border: 1px solid #eee;border-radius: 8px;overflow: hidden;}.details-table tr:last-child {margin-bottom: 0;}.details-table tr:nth-child(even) {background-color: transparent;}}</style></head><body style="margin: 0; padding: 0; background-color: #f4f4f4;"><center style="width: 100%; background-color: #f4f4f4;"><!--[if mso | IE]><table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color: #f4f4f4;"><tr><td align="center" valign="top"><![endif]--><div class="email-container" style="max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);"><!-- Header --><table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td class="header" style="background-color: #4A90E2; padding: 20px 0; text-align: center; border-top-left-radius: 8px; border-top-right-radius: 8px;"><div class="automated-email-banner" style="background-color: #FFD700; display: inline-block; padding: 10px 20px; border-radius: 5px; font-weight: bold; color: #333333; font-size: 20px; margin-bottom: 10px;">Automated email</div><h1 style="color: #ffffff; font-size: 24px; margin: 10px 0 0 0; padding: 0 20px;">Stillage Movement Notification</h1></td></tr></table><!-- Content Area --><table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td class="content-area" style="padding: 20px 30px; line-height: 1.6; color: #555555;"><p style="margin-bottom: 15px;">Dear Recipient,</p><p style="margin-bottom: 15px;">This automated email confirms a recent movement of a stillage. Below are the details of the transaction:</p><!-- Details Table --><table role="presentation" cellspacing="0" cellpadding="0" border="0" class="details-table" style="width: 100%; border: 1px solid #eeeeee; border-radius: 8px; overflow: hidden; margin-top: 20px; margin-bottom: 20px;"><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Stillage Number:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #ffffff; color: #666666; width: 65%;">[stillageNumber]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Source Warehouse:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #fdfdfd; color: #666666; width: 65%;">[sourceWarehouse]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Target Warehouse:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #ffffff; color: #666666; width: 65%;">[targetWarehouse]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Transaction Type:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #fdfdfd; color: #666666; width: 65%;">[transactionType]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Content ID:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #ffffff; color: #666666; width: 65%;">[contentId]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Employee Name:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #fdfdfd; color: #666666; width: 65%;">[employeeName]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Transaction Datetime:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #ffffff; color: #666666; width: 65%;">[transactionDatetime]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Override Authorization:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #fdfdfd; color: #666666; width: 65%;">[overrideAuth]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Overrided:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #ffffff; color: #666666; width: 65%;">[overrided]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Override Code:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #fdfdfd; color: #666666; width: 65%;">[overrideCode]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Hook in Good Condition:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #ffffff; color: #666666; width: 65%;">[hookInGoodCondition]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Floor Mesh in Good Condition:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #fdfdfd; color: #666666; width: 65%;">[floorMeshInGoodCondition]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Stillage in General Good Condition:</th><td style="padding: 12px 15px; text-align: left; border-bottom: 1px solid #eeeeee; background-color: #ffffff; color: #666666; width: 65%;">[stillageIsInGeneralGoodCondition]</td></tr><tr><th style="padding: 12px 15px; text-align: left; border-bottom: none; background-color: #f8f8f8; font-weight: bold; color: #333333; width: 35%;">Remaining Cycles:</th><td style="padding: 12px 15px; text-align: left; border-bottom: none; background-color: #fdfdfd; color: #666666; width: 65%;">[remainingCycles]</td></tr></table><p style="margin-bottom: 15px;">If you have any questions or require further information, please do not hesitate to contact our support team.</p><p style="margin-bottom: 0;">Thank you for your attention to this matter.</p></td></tr></table><!-- Footer --><table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td class="footer" style="background-color: #f0f0f0; padding: 20px 30px; text-align: center; font-size: 12px; color: #999999; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;"><p style="margin: 0;">&copy; 2025 ATD Alliance. All rights reserved.</p><p style="margin: 5px 0 0 0;"><a href="https://yourcompany.com/privacy" style="color: #4A90E2; text-decoration: underline;">Privacy Policy</a> |<a href="https://yourcompany.com/unsubscribe" style="color: #4A90E2; text-decoration: underline;">Unsubscribe</a></p></td></tr></table></div><!--[if mso | IE]></td></tr></table><![endif]--></center></body></html>
''';

  Future<TransferLog?> getStillagePosition(
      Session session, String stillage) async {
    return (await TransferLog.db.find(session,
            where: (p0) => p0.stillageNumber.equals(stillage),
            orderBy: (p0) => p0.id,
            orderDescending: true))
        .first;
  }

  Future<TransferLog> acceptStillage(
      Session session, TransferLog transfer) async {
    if (await getStillagePosition(session, transfer.stillageNumber) == null) {
      return await TransferLog.db.insertRow(
          session,
          transfer.copyWith(
              sourceWarehouse: 'origin',
              id: null,
              transactionDatetime: DateTime.now().add(Duration(hours: 2))));
    }
    final TransferLog tempTransfer = await TransferLog.db.insertRow(
        session,
        transfer.copyWith(
            id: null,
            transactionDatetime: DateTime.now().add(Duration(hours: 2))));

    try {
      mailServer = gmail(email, password);

      tempTransfer.toJson().entries.forEach((entry) {
        stillageMovementEmailHtml = stillageMovementEmailHtml.replaceAll(
            '[${entry.key}]', entry.value.toString());
      });
      Message message = Message();
      message.from = Address(email);
      message.recipients.add('pricillar@atdalliace.co.za');
      message.recipients.add('kholofelol@atdalliace.co.za');
      message.html = stillageMovementEmailHtml;
      message.subject = 'Automated: Stillage Tracker';
      await send(message, mailServer!);
      print('Message Sent');
    } catch (e) {
      print(e);
    }

    return tempTransfer;
  }

  Future<List<TransferLog?>> listStillageStatus(Session session) async {
    List<TransferLog?> transfers = [];
    List<String?> stillages = (await StillageMaster.db.find(session))
        .map((val) => val.stillageNumber)
        .toList();
    if (stillages.length < 1) {
      throw (Exception('No registered stillages exception'));
    }
    for (var stl in stillages) {
      transfers.add((await TransferLog.db.find(session,
              where: (p0) => p0.stillageNumber.equals(stl),
              orderBy: (p0) => p0.transactionDatetime,
              orderDescending: true,
              limit: 1))
          .first);
    }
    return transfers;
  }
}
